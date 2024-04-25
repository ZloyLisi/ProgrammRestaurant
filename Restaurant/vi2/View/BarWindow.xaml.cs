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
using System.Windows.Threading;
using vi2.Model;

namespace vi2.View
{
    /// <summary>
    /// Логика взаимодействия для BarWindow.xaml
    /// </summary>
    public partial class BarWindow : Window
    {
        private DispatcherTimer _updateTimer;
        public BarWindow()
        {
            InitializeComponent();
            DGridDrink.ItemsSource = RestaurantBDEntities1.GetContext().Order.ToList();
            InitializeUpdateTimer();
            LoadData();
        }
        private void InitializeUpdateTimer()
        {
            // Создаем таймер
            _updateTimer = new DispatcherTimer();
            // Устанавливаем интервал обновления (например, каждые 30 секунд)
            _updateTimer.Interval = TimeSpan.FromSeconds(30);
            // Подписываемся на событие Tick таймера
            _updateTimer.Tick += UpdateTimer_Tick;
            // Запускаем таймер
            _updateTimer.Start();
        }

        private void UpdateTimer_Tick(object sender, EventArgs e)
        {
            // Обновляем данные
            LoadData();
        }

        private void DeletOrder_Click(object sender, RoutedEventArgs e)
        {
            var Del = DGridDrink.SelectedItems.Cast<Order>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {Del.Count()} элементов?", "Внимание", MessageBoxButton.YesNo,
                MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    RestaurantBDEntities1.GetContext().Order.RemoveRange(Del);
                    RestaurantBDEntities1.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    LoadData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void exit_Click(object sender, RoutedEventArgs e)
        {
            // Останавливаем таймер при закрытии окна
            if (_updateTimer != null)
            {
                _updateTimer.Stop();
            }
            Close();
        }
        private void LoadData()
        {
            // Загружаем данные из базы данных, фильтруем их и устанавливаем в качестве источника для DGridDish
            DGridDrink.ItemsSource = RestaurantBDEntities1.GetContext().Order
                .Where(order => order.DishAndDrink.IdCategoryDishAndDrink == 1)
                .ToList();
        }
    }
}
