# Python imagedan foydalanamiz
FROM python:3.11

# Ishchi papkani yaratamiz
WORKDIR /app

# Kerakli fayllarni nusxalash
COPY requirements.txt requirements.txt

# Bog'liqliklarni o'rnatish
RUN pip install -r requirements.txt

# Barcha fayllarni nusxalash
COPY . .

# Django uchun muhit o'zgaruvchisini sozlash
ENV DJANGO_SETTINGS_MODULE=config.settings

# Docker konteyneri ishga tushganda Daphne'ni ishga tushirish
CMD ["daphne", "-b", "0.0.0.0", "-p", "8000", "config.asgi:application"]
