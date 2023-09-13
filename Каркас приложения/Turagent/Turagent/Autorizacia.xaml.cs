using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Turagent.Class;

namespace Turagent
{
    /// <summary>
    /// Логика взаимодействия для Autorizacia.xaml
    /// </summary>
    public partial class Autorizacia : Page
    {
        public Autorizacia()
        {
            InitializeComponent();
        }

        private void Enter(object sender, RoutedEventArgs e)
        {
            if (Login.Text == "root" && Password.Text == "12345")
            {
                Manager.MainFrame.Navigate(new Admin());
            }
            if (Login.Text == "user" && Password.Text == "12345")
            {
                Manager.MainFrame.Navigate(new User());
            }
        }
    }
}
