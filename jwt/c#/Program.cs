using System;

public class Program
{
    public static void Main()
    {
        DecodeAndPrint("abc=");
        DecodeAndPrint("abc==");
    }

    static void DecodeAndPrint(string base64)
    {
        Console.WriteLine(
            "'{0}' -> [{1}]",
            base64,
            string.Join(", ", Convert.FromBase64String(base64)));
    }
}