# 🏅 **Olympic Insights 1896–2016: Power BI Data Analytics Dashboard**


<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Olympic_rings_without_rims.svg/320px-Olympic_rings_without_rims.svg.png" alt="Olympic Banner" />
</div>


---
## 🌍 Project Overview

**Olympic Insights 1896–2016** is an **interactive Power BI dashboard** that visualizes **120 years of Olympic history**, from the first games in **Athens (1896)** to **Rio (2016)**.  
It provides deep insights into **athlete participation, gender distribution, medal trends, and top-performing nations and athletes** — all in a visually compelling, data-driven format.

---

## 💡 Key Highlights

### 🥇 **Olympic Participation Through the Era**
- Explore how athlete participation evolved across different countries and decades.
- See which nations dominated and how global inclusion grew over time.

### 🏆 **Medal Winning Rates by Country**
- Compare gold, silver, and bronze medal counts across top countries.
- Easily identify high-performing nations through stacked visualizations.

### 👩‍🦰👨‍🦰 **Gender Distribution of the Most Popular Sports**
- Examine how male and female participation evolved through the years.
- Highlights the rise of women in athletics and other major sports.

### 🥈 **Top Medal-Winning Athletes**
- Displays top athletes and their medal breakdowns across multiple games.
- Highlights legends like *Usain Bolt* and *Allyson Felix* for their iconic performances.

### 📅 **Yearly Gender Participation (%)**
- Interactive pie chart showing the male-female participation ratio each year.
- Illustrates the progress toward gender equality in sports.

---

## 📸 Dashboard Preview

![Olympic Dashboard Screenshot](images/preview.gif)
<div align="center">
 
 
  <p>
    <a href="https://www.novypro.com/project/interactive-olympics-analysis-" target="_blank">
      🚀 Live PowerBI Dashboard
    </a>
  </p>
  
</div>

---

## 📊 Dataset Overview

This project uses the **Olympic Historical Dataset (1896–2016)**, containing detailed athlete-level data for both **Summer and Winter Games**.

| Column Name | Description |
|--------------|-------------|
| **Name** | Athlete’s full name |
| **Sex** | Gender (M/F) |
| **Age** | Age of the athlete during competition |
| **Height** | Height in centimeters |
| **Weight** | Weight in kilograms |
| **Team** | Country represented |
| **NOC** | National Olympic Committee code |
| **Games** | Olympic edition (e.g., 2012 Summer) |
| **Year** | Year of the event |
| **Season** | Summer or Winter Olympics |
| **City** | Host city |
| **Sport** | Sport category (e.g., Athletics, Swimming) |
| **Event** | Specific event |
| **Medal** | Medal won (Gold, Silver, Bronze, or NA) |

> 📂 **Source:** [120 Years of Olympic History: Athletes and Results](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results)

---

## 🧠 Insights Uncovered

📈 **USA** leads in overall participation and medal wins.  
🇯🇲 **Jamaica** and 🇰🇪 **Kenya** dominate in Athletics with remarkable medal efficiency.  
👩‍🦰 Female participation has grown to **48% by 2016**, nearly reaching gender parity.  
🏃‍♂️ **Usain Bolt** and **Allyson Felix** emerge as top medalists in Athletics.




---

## 🧹 Data Preparation Process

1. **Data Cleaning:**  
   - Removed nulls and duplicates in height, weight, and medals.  
   - Standardized country names and NOC codes.

2. **Data Transformation:**  
   - Created calculated columns for medal counts and participation rates.  
   - Filtered dataset between **1896 and 2016** for consistency.

3. **Modeling:**  
   - Established relationships between *Athletes*, *Games*, *Sports*, and *Medals* tables.  
   - Built KPIs: Total Athletes, Total Countries, Total Medals, and Gender Ratio.

---

## 🎨 Dashboard Features & Design

| Section | Visualization Type | Description |
|----------|--------------------|--------------|
| **Olympic Participation** | Horizontal Bar Chart | Shows country participation trends |
| **Medal Winning Rates** | Stacked Column Chart | Displays medal breakdowns per country |
| **Top Athletes** | Clustered Bar Chart | Lists athletes with most medals |
| **Gender Distribution** | Column Chart | Male vs Female participation |
| **Yearly Gender Ratio** | Pie Chart | Percentage comparison of genders |
| **Medal Count Table** | Interactive Table | Country-wise medal count with filters |

---

## 🧾 How to Use the Dashboard

1. Download the file **`Olympic_Analysis.pbix`** from this repository.  
2. Open it using **Microsoft Power BI Desktop**.  
3. Interact with the dashboard using slicers for:
   - **Year**
   - **Country**
   - **Sport**
   - **Medal Type**
4. Explore dynamic visuals and discover trends in Olympic performance.

---

## 🎯 Project Goals

- Visualize **120 years of Olympic evolution** interactively.  
- Understand **gender participation trends** and **global diversity**.  
- Highlight **top-performing nations** and **athletes** across all eras.  
- Present a visually engaging, data-driven story using Power BI.

---

## 🌟 Key Metrics

| Metric | Description |
|--------|--------------|
| **3,595** | Total Athletes (Filtered View) |
| **203** | Countries Participated |
| **382** | Total Medals Counted |
| **1** | Sport Displayed (Athletics) |

---
## 🗂 Repository Structure
```
📦 Olympic-Insights-PowerBI
┣ 📁 Dataset/
    ┗ athletes.csv
┣ 📊 Olympic_Analysis.pbix
┣ 📁 images/
    ┗ preview.csv
┣ 📄 README.md
┗ 📁 Reports/
┗ Olympic_Analysis_Report.pdf

```
## 🛠 Tools & Technologies

| Tool | Purpose |
|------|----------|
| 🧮 **Microsoft Power BI** | Interactive data visualization |
| 🧹 **Power Query** | Data cleaning and transformation |
| 🧾 **DAX (Data Analysis Expressions)** | Custom measures and KPIs |
| 📊 **Excel / CSV** | Dataset handling |
| 🧠 **GitHub** | Version control and project sharing |
| 🧠 **Novypro** | Publicly posting in an online platform

---


## 👤 Author

 #### &nbsp; Dinesh Barri

-  [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dineshbarri)
-  [![Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/dinesh-barri-7654b010b)
---

 ## 📜 License

This project is licensed under the **Apache License 2.0** - see the [LICENSE](LICENSE) file for complete details.

**Apache License 2.0 © 2025 Dinesh Barri**

---

*Free to use for personal and commercial projects. Attribution appreciated but not required.*

