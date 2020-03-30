using ProjetoCincoSolas.Business;
using ProjetoCincoSolas.DAO;
using ProjetoCincoSolas.ViewModel;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;

namespace ProjetoCincoSolas.Views
{
    public class PerolasController : Controller
    {
        private readonly ComentarioBiblicoNegocio _comentarioBiblicoNegocio;

        public PerolasController()
        {
            _comentarioBiblicoNegocio = new ComentarioBiblicoNegocio();
        }

        // GET: Perolas
        public ActionResult Index()
        {
            return View();
        }

        // GET: Perolas/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Perolas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Perolas/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Perolas/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Perolas/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Perolas/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Perolas/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
