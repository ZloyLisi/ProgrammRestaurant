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
using System.Windows.Shapes;
using vi2.Model;

namespace vi2.View
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private void authorization(object sender, RoutedEventArgs e)
        {
            

            // Здесь должна быть логика проверки имени пользователя и пароля
            // Для примера предположим, что пользователь существует
            User user = RestaurantBDEntities1.GetContext().User.FirstOrDefault(u => u.Login == login.Text && u.Password == password.Password);

            if (user != null)
            {
                switch (user.IdRole)
                {
                    case 1: // Кухня
                        var kitchenWindow = new KitchenWindow();
                        kitchenWindow.DeletOrder.Visibility = Visibility.Collapsed;
                        kitchenWindow.Show();
                        break;
                    case 2: // Бар
                        var barWindow = new BarWindow();
                        barWindow.DeletOrder.Visibility= Visibility.Collapsed;
                        barWindow.Show();
                        break;
                    case 3: // Админ
                        new MainWindow().Show();
                        break;
                    case 4: // Ограниченный доступ
                        var mainWindow = new MainWindow
                        {
                            EditButtonVisibility = Visibility.Collapsed,
                            DeletButtonVisibility = Visibility.Collapsed,
                            AddDishButtonVisibility = Visibility.Collapsed,
                            AddDrinkButtonVisibility = Visibility.Collapsed,
                            KitchenButtonVisibility = Visibility.Collapsed,
                            BarButtonVisibility = Visibility.Collapsed
                        };
                        
                       
                        mainWindow.Show();
                        break;
                    default:
                        MessageBox.Show("Неизвестная роль пользователя.");
                        break;
                }
                this.Close(); // Закрываем окно логина
            }
            else
            {
                MessageBox.Show("Неверное имя пользователя или пароль.");
            }
        }
    }
    
}
