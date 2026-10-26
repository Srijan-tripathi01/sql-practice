-- Exploratory Data Analysis

select * 
from layoff_staging2;
 
 Select max(total_laid_off), Max(percentage_laid_off)
 from layoff_staging2;
 
 select * 
 from layoff_staging2
 where percentage_laid_off = 1
 order by funds_raised_millions desc;
 
 select company, SUM(total_laid_off)
 from layoff_staging2
 group by company
 order by 2 desc;
 
 Select MIN(`Date`), MAX(`Date`)
 from layoff_staging2;
 
Select industry, SUM(total_laid_off)
 from layoff_staging2
 group by industry
 order by 2 desc;
 
select Country, SUM(total_laid_off)
from layoff_staging2
group by Country
order by 2 desc;

  select Year(`date`), SUM(total_laid_off)
 from layoff_staging2
 group by Year(`date`)
 order by 1 desc;
 
 select * 
from layoff_staging2;