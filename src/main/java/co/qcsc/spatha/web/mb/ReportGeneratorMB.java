package co.qcsc.spatha.web.mb;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

@ManagedBean(name="reportGeneratorMB")
@SessionScoped
public class ReportGeneratorMB {

    public void generateReport(ActionEvent actionEvent) throws ClassNotFoundException,
            SQLException, IOException, JRException {
        Connection connection;

        // Buscamos el contexto de jsf
        FacesContext facesContext = FacesContext.getCurrentInstance();
        HttpServletResponse response = (HttpServletResponse) facesContext.getExternalContext()
                .getResponse();
        // Con el contexto buscamos el jasper
        // Ojo / es webapp
        InputStream reportStream = facesContext.getExternalContext().getResourceAsStream(
                "/resources/reports/index.jasper");
        ServletOutputStream servletOutputStream = response.getOutputStream();

        // Nos conectamos a la base de datos (creamos una coneccion)
        Class.forName("org.postgresql.Driver");
        // Ojo mybase es el nombre de la base, user y password.
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/sid", "uvlab",
                "uvlab");
        // seteamos el contentType
        response.setContentType("application/pdf");

        // ejecutamos el reporte
        JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, new HashMap(),
                connection);
        // Cerramos la coneccion a la Base
        connection.close();
        // flush y close del reporte
        servletOutputStream.flush();
        servletOutputStream.close();
        facesContext.responseComplete();
    }

}
