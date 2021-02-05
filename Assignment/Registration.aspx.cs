using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace Assignment
{
    public partial class Registration : System.Web.UI.Page
    {

        // Password Hash with Salt
        string MYDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString;
        static string finalHash;
        static string salt;
        byte[] Key;
        byte[] IV;

        // Data Encryption
        protected byte[] encryptData(string data)
        {
            byte[] cipherText = null;
            try
            {
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.IV = IV;
                cipher.Key = Key;
                ICryptoTransform encryptTransform = cipher.CreateEncryptor();
                //ICryptoTransform decryptTransform = cipher.CreateDecryptor();
                byte[] plainText = Encoding.UTF8.GetBytes(data);
                cipherText = encryptTransform.TransformFinalBlock(plainText, 0,
               plainText.Length);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { }
            return cipherText;
        }



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //if (tb_verification.Text.ToLower() == Session["CaptchaVerify"].ToString())
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
            //    lbl_captcha.Text = "You have entered the wrong Captcha. Please enter correct Captcha";
            //    lbl_captcha.ForeColor = System.Drawing.Color.Red;
            //}


            // Password Hashing

            string pwd = tb_password.Text.ToString();

                // Generates Salt
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] saltByte = new byte[8];

                // Fills array of bytes with a cryptographically strong sequence of random values.
            rng.GetBytes(saltByte);
            salt = Convert.ToBase64String(saltByte);
            SHA512Managed hashing = new SHA512Managed();
            string pwdWithSalt = pwd + salt;
            byte[] plainHash = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwd));
            byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
            finalHash = Convert.ToBase64String(hashWithSalt);
            RijndaelManaged cipher = new RijndaelManaged();
            cipher.GenerateKey();
            Key = cipher.Key;
            IV = cipher.IV;
            createAccount();
            Response.Redirect("Login.aspx");
        }

        public void createAccount()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(MYDBConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Account VALUES(@FirstName, @LastName, @CreditCardNumber, @ExpiryDate, @CVV, @Email, @DateOfBirth, @PasswordHash, @PasswordSalt)"))
                {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("@FirstName", tb_fname.Text.Trim());
                            cmd.Parameters.AddWithValue("@LastName", tb_lname.Text.Trim());
                            cmd.Parameters.AddWithValue("@CreditCardNumber", encryptData(tb_creditNo.Text.Trim()));
                            cmd.Parameters.AddWithValue("@ExpiryDate", tb_creditExpiry.Text.Trim());
                            cmd.Parameters.AddWithValue("@CVV", tb_creditCVV.Text.Trim());
                            cmd.Parameters.AddWithValue("@Email", tb_email.Text.Trim());
                            cmd.Parameters.AddWithValue("@DateOfBirth", tb_dob.Text.Trim());
                            cmd.Parameters.AddWithValue("@PasswordHash", finalHash);
                            cmd.Parameters.AddWithValue("@PasswordSalt", salt);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        // Password Complexity Check

        private int checkPassword(string password)
        {
            int score = 0;
            if (password.Length < 8)
            {
                return 1;
            }

            if (password.Length >= 8)
            {
                score++;
            }

            if (Regex.IsMatch(password, "[a-z]"))
            {
                score++;
            }

            if (Regex.IsMatch(password, "[A-Z]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[0-9]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[^A-Za-z0-9]"))
            {
                score++;
            }

            return score;
        }
        protected void btnComplexity_Click(object sender, EventArgs e)
        {
            int scores = checkPassword(tb_password.Text);
            string status = "";
            switch (scores)
            {
                case 1:
                    status = "Very Weak";
                    break;
                case 2:
                    status = "Weak";
                    break;
                case 3:
                    status = "Medium";
                    break;
                case 4:
                    status = "Strong";
                    break;
                case 5:
                    status = "Excellent";
                    break;
                default:
                    break;
            }
            lbl_complexity.Text = "Status : " + status;
            if (scores < 4)
            {
                lbl_complexity.ForeColor = Color.Red;
                return;
            }
            lbl_complexity.ForeColor = Color.Green;
        }


    }
}