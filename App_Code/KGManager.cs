using System;

/// <summary>
/// Summary description for ConnManager
/// </summary>
public static class KGManager
{
    //Logged In user Information
    public static String userLogin = "";
    public static String userPassword = "";
    //Logger file
    public static System.IO.StreamWriter file = new System.IO.StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "Log.txt");

    public static void logOut()
    {
        userLogin = "";
        userPassword = "";
    }
    
    public static void log(String msg)
    {
        file.WriteLine(DateTime.Now.ToString("dd-MM : HH-mm-ss") + " - " + msg);
        file.Flush();
    }
    
}