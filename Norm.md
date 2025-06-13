# 📘 **The Norm - มาตรฐานการเขียนโค้ด C ของ 42 School**
**เวอร์ชัน 4.1 (แปลภาษาไทย)**

---

## 📖 **คำนำ (Foreword)**

**Norminette** เป็นเครื่องมือ Python แบบ open source ที่ตรวจสอบการปฏิบัติตาม The Norm ของซอร์สโค้ดของคุณ มันตรวจสอบข้อจำกัดหลายประการของ The Norm แต่ไม่ใช่ทั้งหมด (เช่น ข้อจำกัดเชิงอัตนัย) เว้นแต่มีกฎระเบียบเฉพาะที่ campus ของคุณ norminette จะเป็นผู้ตัดสินขั้นสุดท้ายในระหว่างการประเมินในรายการที่ควบคุม

กฎที่ไม่ได้ถูกตรวจสอบโดย norminette จะถูกทำเครื่องหมายด้วย **(*)**  และอาจทำให้โปรเจคล้มเหลว (ใช้ Norm flag) หากผู้ประเมินค้นพบระหว่างการตรวจสอบโค้ด

**Repository:** https://github.com/42School/norminette

---

## 🤔 **ทำไมต้องมี The Norm?**

The Norm ถูกสร้างขึ้นอย่างพิถีพิถันเพื่อตอบสนองความต้องการทางการศึกษาหลายประการ:

### **1. ลำดับการทำงาน (Sequencing)**
- การเขียนโปรแกรมหมายถึงการแบ่งงานใหญ่และซับซ้อนออกเป็นชุดคำสั่งพื้นฐานยาวๆ
- คำสั่งทั้งหมดจะทำงานตามลำดับ: ทีละคำสั่ง
- มือใหม่ต้องการสถาปัตยกรรมที่เรียบง่ายและชัดเจน
- **ฟังก์ชันไม่เกิน 25 บรรทัด, ห้ามใช้ `for`, `do..while`, ternary operators**

### **2. รูปลักษณ์และความรู้สึก (Look and Feel)**
- เพื่อให้แลกเปลี่ยนกับเพื่อนและเพื่อนร่วมงานได้ง่าย
- ไม่ต้องเสียเวลาถอดรหัสโค้ดของคนอื่น
- **การตั้งชื่อ, การเว้นวรรค, การใช้ tabs และ spaces มีกฎเกณฑ์เฉพาะ**

### **3. วิสัยทัศน์ระยะยาว (Long-term vision)**
- โค้ดที่เข้าใจง่ายคือวิธีที่ดีที่สุดในการบำรุงรักษา
- หลีกเลี่ยงสถานการณ์ที่โค้ดหยุดการบำรุงรักษาเพราะใช้เวลามาก

### **4. อ้างอิง (References)**
- กฎเหล่านี้ไม่ใช่ความคิดเห็นส่วนตัว แต่มีเหตุผลและการอ้างอิงที่ดี

---

## 📋 **The Norm - กฎเกณฑ์**

### **🏷️ การตั้งชื่อ (Naming)**

#### **กฎบังคับ:**
```c
// โครงสร้างต้องขึ้นต้นด้วย s_
struct s_point { ... };

// typedef ต้องขึ้นต้นด้วย t_
typedef struct s_point t_point;

// union ต้องขึ้นต้นด้วย u_
union u_data { ... };

// enum ต้องขึ้นต้นด้วย e_
enum e_color { ... };

// ตัวแปรโกลบอลต้องขึ้นต้นด้วย g_
int g_global_var;
```

#### **กฎการตั้งชื่อ:**
- ✅ **ใช้ได้**: lowercase, ตัวเลข, underscore (`snake_case`)
- ❌ **ห้าม**: ตัวพิมพ์ใหญ่, camelCase, PascalCase
- ✅ **ชื่อไฟล์และโฟลเดอร์**: lowercase, ตัวเลข, underscore เท่านั้น
- ❌ **ห้าม**: อักขระที่ไม่ใช่ ASCII (ยกเว้นใน string literals)

#### **แนวทางปฏิบัติ (*)**
- ชื่อต้องชัดเจนและอ่านเข้าใจได้เป็นภาษาอังกฤษ
- แต่ละคำแยกด้วย underscore
- ห้ามใช้ global variables ที่ไม่ได้ mark เป็น const หรือ static

---

### **📐 การจัดรูปแบบ (Formatting)**

#### **ข้อจำกัดพื้นฐาน:**
```c
// ✅ ฟังก์ชันไม่เกิน 25 บรรทัด (ไม่นับวงเล็บปีกกา)
// ✅ บรรทัดไม่เกิน 80 ตัวอักษร
// ✅ ใช้ tab (4 spaces) สำหรับ indentation
```

#### **การเว้นบรรทัด:**
```c
// ✅ ฟังก์ชันต้องแยกด้วยบรรทัดว่าง
int func1(void)
{
    return (0);
}

int func2(void)  // บรรทัดว่างด้านบน
{
    return (1);
}
```

#### **การจัดวงเล็บ:**
```c
// ✅ วงเล็บอยู่คนละบรรทัด (ยกเว้น struct, enum, union)
if (condition)
{
    // โค้ด
}

// ✅ struct declaration exception
typedef struct s_point
{
    int x;
    int y;
} t_point;
```

#### **การประกาศตัวแปร:**
```c
int main(void)
{
    int     a;      // ประกาศที่ต้นฟังก์ชัน
    int     b;      // จัดให้ตรงคอลัมน์
    char    *str;   // * ติดกับชื่อตัวแปร
                    // บรรทัดว่างหลังประกาศ
    a = 5;          // โค้ดส่วนอื่น
    return (0);
}
```

#### **การเว้นวรรค:**
```c
// ✅ เว้นวรรครอบ operator
a = b + c;
if (a == b)

// ✅ เว้นวรรคหลัง C keywords (ยกเว้น type keywords)
if (condition)
while (condition)
sizeof(int)    // ไม่เว้นวรรค

// ✅ เว้นวรรคหลัง comma และ semicolon (ยกเว้นท้ายบรรทัด)
func(a, b, c);
```

---

### **🔧 ฟังก์ชัน (Functions)**

#### **ข้อจำกัด:**
```c
// ✅ พารามิเตอร์สูงสุด 4 ตัว
int my_func(int a, char b, char *c, int d);

// ✅ ไม่มีพารามิเตอร์ต้องใส่ void
int func_no_params(void);

// ✅ พารามิเตอร์ใน prototype ต้องมีชื่อ
int add(int first_number, int second_number);

// ✅ ตัวแปรไม่เกิน 5 ตัวต่อฟังก์ชัน
// ✅ return ต้องอยู่ในวงเล็บ (ยกเว้นไม่ return อะไร)
return (result);
return ; // ไม่ return ค่า

// ✅ tab เดียวระหว่าง return type และชื่อฟังก์ชัน
int     my_function(void);
```

---

### **📊 Typedef, struct, enum และ union**

```c
// ✅ การประกาศ struct
struct s_point
{
    int x;      // indentation ปกติ
    int y;
};

// ✅ การใช้ typedef
typedef struct s_point
{
    int x;
    int y;
} t_point;

// ✅ การประกาศตัวแปร
struct s_point  point1;    // เว้นวรรคหลัง struct
t_point         point2;    // จัดคอลัมน์

// ❌ ห้ามประกาศ structure ในไฟล์ .c
```

---

### **📁 Headers (ไฟล์ include)**

#### **สิ่งที่อนุญาตในไฟล์ header:**
- Header inclusions (system หรือไม่ใช่)
- Declarations
- Defines
- Prototypes 
- Macros

#### **กฎการใช้:**
```c
#ifndef FT_HEADER_H
# define FT_HEADER_H
# include <stdlib.h>    // includes ต้องอยู่ต้นไฟล์
# include <stdio.h>
# define FOO "bar"

int     g_variable;     // declarations
struct  s_struct;       // prototypes

#endif
```

#### **การป้องกัน double inclusion:**
- ไฟล์ `ft_foo.h` ใช้ macro `FT_FOO_H`
- ❌ ห้าม include ไฟล์ .c ในไฟล์ header หรือไฟล์ .c อื่น
- **(*) ห้าม include headers ที่ไม่ได้ใช้**

---

### **🎯 42 Header - เริ่มไฟล์อย่างมีสไตล์**

#### **บังคับ:**
ทุกไฟล์ .c และ .h ต้องเริ่มต้นด้วย standard 42 header:

```c
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   filename.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: username <username@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/01 10:00:00 by username          #+#    #+#             */
/*   Updated: 2024/01/01 10:00:00 by username         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
```

#### **ข้อมูลที่ต้องมี (*)**
- Creator พร้อม login และ student email
- วันที่สร้าง
- Login และวันที่ของการอัพเดทล่าสุด

---

### **⚙️ Macros และ Pre-processors**

#### **กฎการใช้:**
```c
// ✅ ใช้สำหรับค่าคงที่เท่านั้น
#define MAX_SIZE 100
#define PI 3.14159

// ❌ ห้ามใช้เพื่อหลีก The Norm หรือทำให้โค้ดยากอ่าน
#define IF if(    // ห้าม!

// ✅ ชื่อ macro ต้องเป็นตัวพิมพ์ใหญ่ทั้งหมด
// ❌ ห้าม multiline macros
// ✅ indent preprocessor directives ใน #if blocks
```

#### **ข้อจำกัด:**
- **(*) ใช้ preprocessor constants เฉพาะ literal และ constant values**
- **(*) ห้าม #define ที่สร้างเพื่อหลีก norm**
- **(*) ใช้ macros จาก standard libraries ได้เฉพาะที่อนุญาต**
- Preprocessor instructions ห้ามใช้นอก global scope

---

### **🚫 สิ่งที่ห้าม (Forbidden stuff!)**

#### **Control structures ที่ห้าม:**
```c
// ❌ ห้ามใช้
for (int i = 0; i < 10; i++)        // ห้าม for
do { ... } while (condition);       // ห้าม do...while  
switch (variable) { ... }           // ห้าม switch
case 1: ...                         // ห้าม case
goto label;                         // ห้าม goto
```

#### **สิ่งอื่นๆ ที่ห้าม:**
```c
// ❌ Ternary operators
int result = (a > b) ? a : b;       // ห้าม

// ❌ Variable Length Arrays (VLA)
int n = 10;
int array[n];                       // ห้าม

// ❌ Implicit type declarations
auto x = 5;                         // ห้าม (C++)
```

---

### **💬 Comments (คอมเมนต์)**

#### **กฎการใช้:**
```c
// ❌ ห้าม comment ใน function body
int func(void)
{
    int a = 5;
    // ห้าม comment ตรงนี้!
    return (a);
}

// ✅ comment ท้ายบรรทัดหรือบรรทัดแยก
int b = 10;    // comment ท้ายบรรทัด OK

// comment บรรทัดแยก OK
int c = 20;
```

#### **แนวทางปฏิบัติ (*)**
- Comment ต้องเป็นภาษาอังกฤษและมีประโยชน์
- Comment ไม่สามารถแก้ตัวให้กับฟังก์ชันที่แย่หรือไม่มีจุดประสงค์ชัดเจน

---

### **📄 Files (ไฟล์)**

#### **ข้อจำกัด:**
```c
// ❌ ห้าม include ไฟล์ .c ในไฟล์ .c
#include "other_file.c"    // ห้าม!

// ✅ สูงสุด 5 function definitions ต่อไฟล์ .c
```

---

### **🔨 Makefile**

Makefile ไม่ได้ถูกตรวจสอบโดย norminette แต่ต้องตรวจสอบโดยนักเรียนในระหว่างการประเมิน

#### **Rules ที่บังคับ:**
```makefile
# ต้องมี rules เหล่านี้
NAME = program_name
all: $(NAME)           # default rule
clean:                 # ลบไฟล์ชั่วคราว
fclean: clean         # ลบทุกอย่างที่สร้างจาก make
re: fclean all        # rebuild ทั้งหมด

# ห้าม relink เมื่อไม่จำเป็น
# ห้ามใช้ wildcards (*.c, *.o)
# ต้องระบุไฟล์ source ทั้งหมดอย่างชัดเจน
```

#### **โปรเจค multibinary:**
- ต้องมี rule สำหรับแต่ละ binary ($(NAME_1), $(NAME_2))
- Rule `all` ต้อง compile ทุก binary

#### **โปรเจคที่ใช้ external library:**
- Makefile ต้องคอมไพล์ library โดยอัตโนมัติ

---

## 🎯 **สรุปสำคัญ**

### **หลัก 4 ข้อหลัก:**
1. **ความเรียบง่าย**: ฟังก์ชันสั้น ชัดเจน ทำงานเดียว
2. **ความสม่ำเสมอ**: รูปแบบเดียวกันทุกคน
3. **ความอ่านง่าย**: ชื่อชัดเจน การจัดรูปแบบสม่ำเสมอ  
4. **ความบำรุงรักษาได้**: โค้ดที่เข้าใจง่ายแก้ไขง่าย

### **เครื่องมือตรวจสอบ:**
```bash
# ตรวจ norm
norminette filename.c

# คอมไพล์ด้วย flags ของ 42
gcc -Wall -Wextra -Werror filename.c
```

### **จุดสำคัญที่ต้องจำ:**
- ✅ ฟังก์ชัน ≤ 25 บรรทัด, พารามิเตอร์ ≤ 4, ตัวแปร ≤ 5
- ✅ บรรทัด ≤ 80 ตัวอักษร
- ✅ ใช้ tabs, ไม่ใช่ spaces สำหรับ indentation
- ✅ 42 header ในทุกไฟล์
- ❌ ห้าม for, do-while, switch, goto, ternary
- ❌ ห้าม VLA, implicit types

**The Norm ไม่ใช่แค่กฎ แต่เป็นวิธีคิดในการเขียนโค้ดที่ดี!** 🚀
