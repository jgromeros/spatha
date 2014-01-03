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

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;

public class ReportServlet extends HttpServlet {

    @Autowired
    public BasicDataSource dataSource;

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
        try {
            connection = dataSource.getConnection();
            response.setContentType("application/pdf");

            JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, new HashMap(),
                    connection);
            connection.close();
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
