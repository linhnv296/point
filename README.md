## create user admin
php artisan voyager:admin itvngame@gmail.com --create

## setting of khoa hoc
{
    "default" : "Tiếng Nhật N5",
    "options" : {
        "Tiếng Nhật N5": "Tiếng Nhật N5",
        "Tiếng Nhật N4": "Tiếng Nhật N4",
        "Tiếng Nhật N3": "Tiếng Nhật N3",
        "Tiếng Hàn Sơ Cấp 1": "Tiếng Hàn Sơ Cấp 1",
        "Tiếng Hàn Sơ Cấp 2": "Tiếng Hàn Sơ Cấp 2",
        "Khóa nghề nhà hàng": "Khóa nghề nhà hàng",
        "Khóa nghề điều dưỡng": "Khóa nghề điều dưỡng",
        "Khóa nghề thực phẩm": "Khóa nghề thực phẩm",
        "Khóa nghề khách sạn": "Khóa nghề khách sạn",
        "Khóa học xây dựng": "Khóa học xây dựng",
        "Khóa nghề Nông nghiệp trồng trọt": "Khóa nghề Nông nghiệp trồng trọt"
    }
}

{
    "default" : "Làm việc trong nước",
    "options" : {
        "Làm việc trong nước": "Làm việc trong nước",
        "Du học": "Du học",
        "Lao động nước ngoài": "Lao động nước ngoài"
    }
}
{
    "default" : "THCS",
    "options" : {
        "THCS": "THCS",
        "THPT": "THPT",
        "Cao Đẳng, Đại Học": "Cao Đẳng, Đại Học"
    }
}
RUN chown -R www-data:www-data /var/www/storage
RUN chmod -R 755 /var/www/storage
