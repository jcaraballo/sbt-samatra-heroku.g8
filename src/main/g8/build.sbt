import sbt._

name := "$name;format="lower,hyphen"$"

version := "0.1"

scalaVersion := "2.12.4"

resolvers += "jitpack" at "https://jitpack.io"

val jettyVersion = "9.4.8.v20171121"

enablePlugins(JavaAppPackaging)

libraryDependencies ++= Seq(
  "com.github.springernature.samatra" %% "samatra" % "v1.5.0",
  "org.eclipse.jetty" % "jetty-webapp" % jettyVersion,
  "org.eclipse.jetty" % "jetty-server" % jettyVersion,
  "org.eclipse.jetty" % "jetty-http" % jettyVersion,
  "org.eclipse.jetty" % "jetty-io" % jettyVersion,
  "org.eclipse.jetty" % "jetty-security" % jettyVersion,
  "org.eclipse.jetty" % "jetty-servlet" % jettyVersion,
  "org.eclipse.jetty" % "jetty-servlets" % jettyVersion,
  "org.eclipse.jetty" % "jetty-util" % jettyVersion,
  "org.eclipse.jetty" % "jetty-jmx" % jettyVersion,
  "org.scalatest" %% "scalatest" % "3.0.1" % "test"
)
