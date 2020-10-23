import picocli.CommandLine
import picocli.CommandLine.{Command, Option, Parameters}

import java.io.File
import java.math.BigInteger
import java.nio.file.Files
import java.security.MessageDigest
import java.util.concurrent.Callable

@Command(name = "checksum", mixinStandardHelpOptions = true, version = Array("checksum 4.0"),
  description = Array("Prints the checksum (MD5 by default) of a file to STDOUT."))
class Checksum extends Callable[Int] {

  @Parameters(index = "0", description = Array("The file whose checksum to calculate."))
  private val file: File = null

  @Option(names = Array("-a", "--algorithm"), description = Array("MD5, SHA-1, SHA-256, ..."))
  private var algorithm = "MD5"

  def call(): Int = {
    val fileContents = Files.readAllBytes(file.toPath)
    val digest = MessageDigest.getInstance(algorithm).digest(fileContents)
    println(("%0" + digest.size * 2 + "x").format(new BigInteger(1, digest)))
    0
  }
}

object Checksum {
  def main(args: Array[String]): Unit = {
    System.exit(new CommandLine(new Checksum()).execute(args: _*))
  }
}
