#!/bin/bash
# สร้างสถานการณ์ทดสอบ

echo "=== สร้างไฟล์ทดสอบ ==="
# ลบไฟล์เก่า
rm -rf test_files
mkdir test_files
cd test_files

# สร้างไฟล์ตามลำดับเวลา
echo "สร้าง file1.txt..."
touch file1.txt
sleep 2

echo "สร้าง folder1..."
mkdir folder1
sleep 2

echo "สร้าง script.sh..."
touch script.sh
sleep 2

echo "สร้าง folder2..."
mkdir folder2
sleep 2

echo "สร้าง .hidden_file (ไฟล์ซ่อน)..."
touch .hidden_file
sleep 2

echo "สร้าง .hidden_folder/ (โฟลเดอร์ซ่อน)..."
mkdir .hidden_folder

echo -e "\n=== ไฟล์ทั้งหมด (รวมซ่อน) ==="
ls -la

echo -e "\n=== ผลลัพธ์จาก 'ls -mptU' ==="
ls -mptU

echo -e "\n=== ผลลัพธ์จาก 'ls -mpt' (ลบ U ออก) ==="
ls -mpt

echo -e "\n=== ผลลัพธ์ที่ถูกต้องตามโจทย์ ==="
ls -1tpF | grep -v '^\..*' | tr '\n' ',' | sed 's/,$//'

echo -e "\n=== สรุปปัญหา ==="
echo "❌ ls -mptU มีปัญหา:"
echo "   1. ยังแสดงไฟล์ซ่อน (.hidden_file, .hidden_folder/)"
echo "   2. -U ขัดแย้งกับ -t (ไม่เรียงตามเวลา)"
echo "   3. มีช่องว่างหลังจุลภาค"

cd ..
