using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для EditAddWindowDrink.xaml
    /// </summary>
    public partial class EditAddWindowDrink : Window
    {
        private readonly bool _isEditDish;
        private readonly DishAndDrink _dishAndDish;
        private readonly RestaurantBDEntities1 _contextDish = RestaurantBDEntities1.GetContext();
        public EditAddWindowDrink(DishAndDrink dishAndDrink = null)
        {
            InitializeComponent();
            _dishAndDish = dishAndDrink ?? new DishAndDrink();
            _isEditDish = dishAndDrink != null;

            // Заполнение ComboBox категориями блюд
            CategoryDishComboBox.ItemsSource = _contextDish.CategoryDish.ToList();
            CategoryDishComboBox.SelectedValuePath = "Id";
            CategoryDishComboBox.DisplayMemberPath = "Name";

            if (_isEditDish)
            {
                // Инициализация полей для редактирования
                NameTextBox.Text = _dishAndDish.Name;
                DescriptionTextBox.Text = _dishAndDish.Description;
                CompositionTextBox.Text = _dishAndDish.Composition;
                PriceTextBox.Text = _dishAndDish.Price.ToString(CultureInfo.InvariantCulture);
                CategoryDishComboBox.SelectedValue = _dishAndDish.IdCategoryDish;
                if (!string.IsNullOrEmpty(_dishAndDish.Foto))
                {
                    PhotoImage.Source = new BitmapImage(new Uri(_dishAndDish.Foto, UriKind.Absolute));
                }
            }
            else
            {
                // Установка значения по умолчанию для новых блюд
                _dishAndDish.IdCategoryDishAndDrink = 2;
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            // Валидация данных
            if (string.IsNullOrWhiteSpace(NameTextBox.Text) ||
                string.IsNullOrWhiteSpace(PriceTextBox.Text) ||
                CategoryDishComboBox.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста, заполните все поля.");
                return;
            }

            if (!decimal.TryParse(PriceTextBox.Text, NumberStyles.Any, CultureInfo.CurrentCulture, out decimal price))
            {
                MessageBox.Show("Цена должна быть числом.");
                return;
            }

            // Сохранение данных
            _dishAndDish.Name = NameTextBox.Text;
            _dishAndDish.Description = DescriptionTextBox.Text;
            _dishAndDish.Composition = CompositionTextBox.Text;
            _dishAndDish.Price = price;
            _dishAndDish.IdCategoryDish = (int)CategoryDishComboBox.SelectedValue;

            if (!_isEditDish)
            {
                _contextDish.DishAndDrink.Add(_dishAndDish);
            }
            else
            {
                _contextDish.Entry(_dishAndDish).State = EntityState.Modified;
            }

            try
            {
                _contextDish.SaveChanges();
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения: {ex.Message}");
            }
        }
    

   

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
        private void UploadFoto_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image files (*.png;*.jpeg;*.jpg)|*.png;*.jpeg;*.jpg|All files (*.*)|*.*"
            };
            if (openFileDialog.ShowDialog() == true)
            {
                _dishAndDish.Foto = openFileDialog.FileName;
                PhotoImage.Source = new BitmapImage(new Uri(_dishAndDish.Foto));
            }
            else
            {
                // Если файл не выбран, показываем сообщение
                MessageBox.Show("Изображение не выбрано.");
            }
        }

        private void PriceTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            // Разрешаем ввод только чисел, точки и запятой
            e.Handled = !Regex.IsMatch(e.Text, @"[0-9.,]");
        }

        private void PriceTextBox_Pasting(object sender, DataObjectPastingEventArgs e)
        {
            if (e.DataObject.GetDataPresent(typeof(string)))
            {
                var text = (string)e.DataObject.GetData(typeof(string));
                if (!Regex.IsMatch(text, @"^[0-9.,]+$"))
                {
                    e.CancelCommand();
                }
            }
            else
            {
                e.CancelCommand();
            }
        }
    }
}
