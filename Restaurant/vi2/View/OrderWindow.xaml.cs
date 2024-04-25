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
    /// Логика взаимодействия для OrderWindow.xaml
    /// </summary>
    public partial class OrderWindow : Window
    {
        public int Quantity { get; set; } = 1; // Начальное количество
        public string DishName { get; set; }
        public int DishAndDrinkId { get; set; } // ID блюда или напитка
        public OrderWindow(string dishName, int dishAndDrinkId)
        {
            InitializeComponent();
            DishName = dishName;
            DishAndDrinkId = dishAndDrinkId;
            DataContext = this;
        }

        private void DecreaseQuantity_Click(object sender, RoutedEventArgs e)
        {
            if (Quantity > 1)
            {
                Quantity--;
                QuantityTextBlock.Text = Quantity.ToString();
            }
        }

        private void IncreaseQuantity_Click(object sender, RoutedEventArgs e)
        {
            Quantity++;
            QuantityTextBlock.Text = Quantity.ToString();
        }

        private void PlaceOrder_Click(object sender, RoutedEventArgs e)
        {
            // Здесь код для сохранения заказа в базу данных
            var newOrder = new Order
            {
                IdDishAndDrink = DishAndDrinkId,
                Quantity = Quantity
            };

            var context = RestaurantBDEntities1.GetContext();
            context.Order.Add(newOrder);
            context.SaveChanges();

            MessageBox.Show("Заказ успешно добавлен!");
            Close();
        }
    }
}
