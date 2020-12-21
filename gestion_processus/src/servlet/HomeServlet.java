package servlet;

import metier.beans.CatalogueProcessus;
import metier.gestionnaire.GestionnaireCatProc;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get list of catalogue
        GestionnaireCatProc gestionnaire = new GestionnaireCatProc();
        List<CatalogueProcessus> procs = gestionnaire.getAll();

        // add catalogue to request paramters and forward to index.jsp
        req.setAttribute("catalogue", procs);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/home.jsp");
        requestDispatcher.forward(req, resp);
    }
}
