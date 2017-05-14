package casa

import com.springer.samatra.routing.Routings.{Controller, Routes}
import com.springer.samatra.routing.StandardResponses.Implicits._
import com.springer.samatra.routing.StandardResponses.{Html, StringResp}
import org.eclipse.jetty.server.{Server, ServerConnector}
import org.eclipse.jetty.servlet.{ServletContextHandler, ServletHolder}

object WebApp extends App {
  private val server = new Server() {
    addConnector(new ServerConnector(this) {
      setPort(sys.env("PORT").toInt)
    })
  }

  server.setHandler(new ServletContextHandler() {
    addServlet(new ServletHolder(
      Routes(
        new Controller {
          get("/:echo") { req => req.captured("echo") }
          get("/") { _ => Html(
            """<!DOCTYPE html>
              |<html><body>
              |  <p>Usage: <span style="font-family:monospace">GET /&lt;message&gt;</span> to have that message talked back</p>
              |  <p>For example go to <a href="/hello">/hello</a> to be greeted.
              |</body></html>""".stripMargin) }
        })), "/*")
  })

  server.start()
  println(
    "WebApp started on port " +
      server.getConnectors.head.asInstanceOf[ServerConnector].getLocalPort
  )
}
