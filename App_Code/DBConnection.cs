using System;
using System.Collections.Generic;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DBConnection
/// </summary>
public static class DBConnection
{
    private static SqlConnection KGConnection;
    private static SqlCommand comm;
    private static String connString = "Data Source=kindergardens.database.windows.net;Initial Catalog=kindergardens;" +
        "Integrated Security=False;User ID=arkiniet;Password=GranitNov10@;Connect Timeout=15;Encrypt=True;TrustServerCertificate=False;" +
        "ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

    public static System.Data.DataTable runProcWithResults(string procName, Dictionary<String, Object> valMap)
    {
        KGManager.log("Received instruction to run procedure " + procName);
        System.Data.DataTable toReturn = new System.Data.DataTable();
        comm = new SqlCommand();
        KGConnection = new SqlConnection(connString);
        comm.CommandText = procName;
        comm.CommandType = System.Data.CommandType.StoredProcedure;
        comm.Connection = KGConnection;

        try
        {
            //Add values to the PROC Execution
            foreach (KeyValuePair<String, Object> entry in valMap)
            {
                comm.Parameters.AddWithValue("@" + entry.Key, entry.Value);
                KGManager.log("Adding parameter @" + entry.Key + "=" + entry.Value);
            }

            KGConnection.Open();

            KGManager.log("Opened KGConnection");
            SqlDataAdapter dr = new SqlDataAdapter(comm);
            KGManager.log("Sending SQL Statement: " + comm.CommandText + " with " + comm.Parameters.Count + " parameters.");
            KGManager.log("Returned #" + dr.Fill(toReturn) + " rows!!");

            return toReturn;

        }
        catch (Exception e)
        {
            KGManager.log("!!!Exception Occured!!!\n" + e.Message + "\n" + e.StackTrace);
            return new System.Data.DataTable();
        }
        finally
        {
            KGManager.log("Closing connection");
            KGConnection.Close();
        }
    }
}