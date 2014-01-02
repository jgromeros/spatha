package co.qcsc.spatha.web.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;

@Configurable
public class ReportServlet extends HttpServlet {

    @Autowired
    private DataSource dataSource;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        generateReport(request, response);
    }
    
    public void generateReport(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection;

        InputStream reportStream =getServletConfig().getServletContext().getResourceAsStream(
                "/resources/reports/index.jasper");
        ServletOutputStream servletOutputStream = response.getOutputStream();

        // Nos conectamos a la base de datos (creamos una coneccion)
        try {
            Class.forName("org.postgresql.Driver");
            // Ojo mybase es el nombre de la base, user y password.
//            connection = DriverManager.getConnection(
//                    "jdbc:postgresql://localhost:5432/sid", "uvlab",
//                    "uvlab");
            connection = dataSource.getConnection();
//            connection = DriverManager.getConnection(
//                    "jdbc:postgresql://ec2-107-20-245-187.compute-1.amazonaws.com:5432/d98sb9cb44b3uf",
//                    "wxprdqdkfalprs", "iisCdwiwVHa1gF2c5h2fddF3jR");
            // seteamos el contentType
            response.setContentType("application/pdf");

            // ejecutamos el reporte
            JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, new HashMap(),
                    connection);
            // Cerramos la coneccion a la Base
            connection.close();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JRException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // flush y close del reporte
        servletOutputStream.flush();
        servletOutputStream.close();
    }

}
