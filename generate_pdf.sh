#!/bin/bash
# Script to regenerate the profile PDF from HTML

echo "Regenerating Profile PDF..."

# Check if wkhtmltopdf is installed
if ! command -v wkhtmltopdf &> /dev/null; then
    echo "Error: wkhtmltopdf is not installed. Please install it first:"
    echo "sudo apt install -y wkhtmltopdf"
    exit 1
fi

# Convert HTML to PDF
wkhtmltopdf \
    --enable-local-file-access \
    --page-size A4 \
    --margin-top 0.75in \
    --margin-right 0.75in \
    --margin-bottom 0.75in \
    --margin-left 0.75in \
    profile.html \
    Hari_Vaarthan_TD_Profile.pdf

if [ $? -eq 0 ]; then
    echo "✅ PDF generated successfully: Hari_Vaarthan_TD_Profile.pdf"
    echo "📄 File size: $(du -h Hari_Vaarthan_TD_Profile.pdf | cut -f1)"
else
    echo "❌ Failed to generate PDF"
    exit 1
fi