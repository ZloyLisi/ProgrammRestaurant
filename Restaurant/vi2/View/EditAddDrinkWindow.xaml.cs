using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
    /// Логика взаимодействия для EditAddWindow.xaml
    /// </summary>
    public partial class EditAddWindow : Window
    {
        public DishAndDrink DishAndDrink { get; set; }
        public string WindowTitle { get; set; }
        public EditAddWindow(DishAndDrink dishAndDrink = null)
        {
            InitializeComponent();
            DishAndDrink = dishAndDrink ?? new DishAndDrink(); // Если null, создаем новую запись
            WindowTitle = dishAndDrink == null ? "Добавление" : "Редактирование";
            DataContext = this;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            var context = RestaurantBDEntities1.GetContext();
            if (DishAndDrink.Id == 0) // Проверяем, новая ли это запись
            {
                context.DishAndDrink.Add(DishAndDrink); // Добавляем новую запись
            }
            else
            {
                context.Entry(DishAndDrink).State = EntityState.Modified; // Обновляем существующую запись
            }
            context.SaveChanges(); // Сохраняем изменения в базе данных
            Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void UploadFoto_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image files (*.png;*.jpeg;*.jpg)|*.png;*.jpeg;*.jpg|All files (*.*)|*.*";
            if (openFileDialog.ShowDialog() == true)
            {
                // Здесь вы можете выбрать, сохранять ли путь к файлу или сам файл.
                // Для примера сохраняем путь к файлу.
                DishAndDrink.Foto = openFileDialog.FileName;
                FotoImage.Source = new BitmapImage(new Uri(DishAndDrink.Foto));
            }
        }
    }
}
