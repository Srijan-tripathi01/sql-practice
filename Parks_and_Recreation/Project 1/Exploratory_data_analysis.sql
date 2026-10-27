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
 
 select company , Avg(percentage_laid_off) 
from layoff_staging2
group by company
order by 1 desc;


Select substring(`Date`,1,7) as `Month`, Sum(total_laid_off)
from layoff_staging2
Where substring(`Date`,1,7) is not null
group by `Month`
order by 1 asc;


With Rolling_total as
(
 Select substring(`Date`,1,7) as `Month`, Sum(total_laid_off)as  total_off
from layoff_staging2
Where substring(`Date`,1,7) is not null
group by `Month`
order by 1 asc
)
Select `Month`, total_off,
Sum(total_off) over(Order by `Month`) As rolling_total
from Rolling_total ;
  
  
  -- company layoffs yearly
  With company_year (company, years, total_laid_off ) as
  (
  Select company, Year(`Date`), Sum(total_laid_off)
  from layoff_staging2
  group by company, Year(`Date`) 
 ), Company_year_rank as(
 Select *, 
 Dense_rank() over (partition by years order by total_laid_off Desc) as Ranking
 From company_year 
 Where Years is not null
 order by Ranking Asc
 )
 Select * 
 from Company_year_rank
 Where Ranking <= 5;
  