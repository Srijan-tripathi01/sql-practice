-- Data Cleaning

select *
from layoffs;

-- 1. REMOVE DUPLICATES
-- 2. STANDARDIZE THE DATA
-- 3. NULL VALUE OR BLANK VALUE
-- 4. REMOVE ANY COULUMNS (IF NECCESSARY)


-- 1 Removing Duplicates

CREATE TABLE Layoff_staging
like layoffs;

select * 
from layoff_staging;


Insert layoff_staging
Select * 
from layoffs;

with duplicate_cte as(
select *, 
row_number() over(
partition by company, location, industry , total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoff_staging
)
select * 
from duplicate_cte
where row_num > 1;	


CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from layoff_staging2;

insert into layoff_staging2
select *, 
row_number() over(
partition by company, location, industry , total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoff_staging;


select *
from layoff_staging2
where row_num > 1;


Delete 
from layoff_staging2
where row_num > 1;


-- Standardizing data

select company, Trim(company)
from layoff_staging2;

update layoff_staging2
set company = Trim(company);

select distinct industry
from layoff_staging2
order by 1;

select *
from layoff_staging2
where industry like 'Crypto%';

update layoff_staging2
set industry = 'Crypto'
where industry like 'Crypto%';


update layoff_staging2
set country = 'Crypto'
where industry like 'Crypto%';

select distinct location 
from layoff_staging2
order by 1;

select distinct country
from layoff_staging2
order by 1;

select distinct country
from layoff_staging2
where country like 'United state%';


update layoff_staging2
set country = 'United States'
where country like 'United State%';


select `date`,
str_to_date(`date`,'%m/%d/%Y')
from layoff_staging2;

Update layoff_staging2
set `Date` = str_to_date(`date`,'%m/%d/%Y');


-- Another way of changing the format of date column

Alter table layoff_staging2
Modify coulumn `date` Date;

select * from layoff_staging2
where total_laid_off is Null
And percentage_laid_off is NULL;
 
-- 3.Removing NUll and Blank Values

select *
from layoff_staging2
where industry is Null
or industry = '';

select * 
from layoff_staging2
where company = 'Airbnb';

-- so some entries have industry type while some have null or blank spaces

select * 
from layoff_staging2 t1
join layoff_staging2 t2
	on t1.company = t2.company
where (t1.industry is Null or t1.industry = '')	
and t2.industry is not null;


select t1.industry, t2.industry
from layoff_staging2 t1
join layoff_staging2 t2
	on t1.company = t2.company
where (t1.industry is Null or t1.industry = '')	
and t2.industry is not null;


update layoff_staging2
set industry = null
where industry = '';


Update layoff_staging2 t1
Join layoff_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is Null )	
and t2.industry is not null;


select * 
from layoff_staging2
where company like 'Bally%';

-- Deleting the data which did not show any layoff entry as those data are not usefull for the project

select * from layoff_staging2
where total_laid_off is Null
And percentage_laid_off is NULL;

Delete
from layoff_staging2
where total_laid_off is Null
And percentage_laid_off is NULL;

-- 4.Removing unnecessary column

Alter table layoff_staging2
drop column row_num;

-- Now the data is clean