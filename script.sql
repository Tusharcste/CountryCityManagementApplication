USE [master]
GO
/****** Object:  Database [CountryCityDB]    Script Date: 7/22/2016 4:04:37 AM ******/
CREATE DATABASE [CountryCityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryCityDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryCityDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryCityDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryCityDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryCityDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryCityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryCityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryCityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryCityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryCityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryCityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryCityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryCityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryCityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryCityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryCityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryCityDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryCityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryCityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryCityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryCityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryCityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryCityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryCityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryCityDB] SET  MULTI_USER 
GO
ALTER DATABASE [CountryCityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryCityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryCityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryCityDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryCityDB]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 7/22/2016 4:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[About] [nvarchar](max) NULL,
	[NoOfDwellers] [int] NULL,
	[Location] [nvarchar](255) NULL,
	[Weather] [nvarchar](255) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 7/22/2016 4:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[About] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[CitiesViewModel]    Script Date: 7/22/2016 4:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CitiesViewModel]
AS
SELECT     ci.CityId, ci.Name AS CityName, ci.About, ci.NoOfDwellers, ci.Location, ci.Weather, co.CountryId, co.Name AS Country, co.About AS [About Country]
FROM         dbo.Cities AS ci INNER JOIN
                      dbo.Countries AS co ON co.CountryId = ci.CountryId


GO
/****** Object:  View [dbo].[CountriesViewModel]    Script Date: 7/22/2016 4:04:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CountriesViewModel]
AS
SELECT        co.CountryId, co.Name, co.About, ci.NoOfDwellers, COUNT(ci.CityId) AS [No. Of Cities], ci.CityId, ci.Name AS Expr1, ci.About AS Expr2, ci.Location, ci.Weather, COUNT(*) AS Expr3
FROM            dbo.Countries AS co INNER JOIN
                         dbo.Cities AS ci ON ci.CountryId = co.CountryId
GROUP BY co.CountryId, co.Name, co.About, ci.NoOfDwellers, ci.CityId, ci.Name, ci.About, ci.Location, ci.Weather

GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityId], [CountryId], [Name], [About], [NoOfDwellers], [Location], [Weather]) VALUES (1, 13, N'Chittagong', N'<p>Chittagong /tʃɪtəɡɒŋ/ is a major coastal seaport city and financial centre in southeastern Bangladesh. <a href="http://en.wikipedia.org/wiki/Chittagong">Wikipedia</a> </p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=chittagong+bangladesh+area&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDLMMrbQkspOttLPyU9OLMnMz4MzrBKLUhMBBYgO4ykAAAA&sa=X&sqi=2&ved=0ahUKEwiAxq-y14bOAhULnZQKHbdvCl8Q6BMIhAEoADAP">Area</a>: 157 km²</p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=chittagong+bangladesh+weather&stick=H4sIAAAAAAAAAOMQfsRYxS3w5GKvpFShkDAXm2NySWZ-nhAnF3t4amJJRmqRUBQXh09-ciJY2E9IiovbrSg1NSmxONU3M0WIm4tTP1ffwMgwy9gCqJ3HNa8ks6TSrzQ3CaiTmYvRQEiaS8QzryS1qKAotQRsCJIkDwBrc_vEfwAAAA&sa=X&sqi=2&ved=0ahUKEwiAxq-y14bOAhULnZQKHbdvCl8Q6BMIhwEoADAQ">Weather</a>: 31°C, Wind S at 34 km/h, 70% Humidity</p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=chittagong+bangladesh+local+time&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDLMMrbQUshOttLPyU9OLMnMz9NPziypLMkvz7MCieQolGTmpgIA4aAl_C8AAAA&sa=X&sqi=2&ved=0ahUKEwiAxq-y14bOAhULnZQKHbdvCl8Q6BMIigEoADAR">Local time</a>: Friday 2:45 PM</p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=chittagong+bangladesh+population&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDLMMrbQ0spOttLPyU9OLMnMz9MvLgHSxSWZyYk58UWp6UAhq4L8gtIcsCwAz_-SuDkAAAA&sa=X&sqi=2&ved=0ahUKEwiAxq-y14bOAhULnZQKHbdvCl8Q6BMIjQEoADAS">Population</a>: 2.582 million (2011)</p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=chittagong+bangladesh+government+body&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDLMMrbQks0ot9JPzs_JSU0uyczP08_JT04EMYqtkvJTKgGHDg97LAAAAA&sa=X&sqi=2&ved=0ahUKEwiAxq-y14bOAhULnZQKHbdvCl8Q6BMIkAEoADAT">Government body</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=Chittagong+City+Corporation&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDLMMrZQAjMtCwrKqrRkM8qt9JPzc3JSk0sy8_P0c_KTE0GMYquk_JRKAJ47HVk3AAAA&sa=X&sqi=2&ved=0ahUKEwiAxq-y14bOAhULnZQKHbdvCl8QmxMIkQEoATAT">Chittagong City </a></p>
', 2500000, N'Chittagong,Bangladesh', N'good')
INSERT [dbo].[Cities] ([CityId], [CountryId], [Name], [About], [NoOfDwellers], [Location], [Weather]) VALUES (2, 13, N'Dhaka', N'<p>This is Dhaka</p>
', 5000, N'Dhaka,Bangladesh', N'good')
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [Name], [About]) VALUES (13, N'Bangladesh', N'<p> </p>

<p><img alt="" src="/Images/500px-Flag_of_Bangladesh.svg.png" style="height:300px; width:500px" /></p>

<p>Bangladesh, east of India on the Bay of Bengal, is South Asian country of lush greenery and many waterways. Its Padma (Ganges), Meghna and Jamuna rivers create fertile alluvial plains, and travel by boat is common. On the southern coast, the Sundarbans, an enormous mangrove forest shared with India, are home to the Royal Bengal tiger.</p>
')
INSERT [dbo].[Countries] ([CountryId], [Name], [About]) VALUES (14, N'India', N'<p><img alt="" src="/Images/images.jpg" style="height:80px; width:120px" /></p>

<p> </p>

<p>India is a vast South Asian country with diverse terrain – from Himalayan peaks to Indian Ocean coastline – and history reaching back 5 millennia. In the north, Mughal Empire landmarks include Delhi’s Red Fort complex, massive Jama Masjid mosque and Agra’s iconic Taj Mahal mausoleum. Pilgrims bathe in the Ganges in Varanasi, and Rishikesh is a yoga center and base for Himalayan trekking.</p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=584&q=india+capital&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC7KNtCSyU620s_JT04syczP00_OL80rKaq0Sk4syCxJzAEARLPV2yoAAAA&sa=X&ved=0ahUKEwjukdu71YbOAhVD5mMKHZNFDXQQ6BMIkAEoADAR">Capital</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=584&q=New+Delhi+India&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC7KNlACs1Jyygy0ZLKTrfRz8pMTSzLz8_ST80vzSooqrZITCzJLEnMA7RK_rzQAAAA&sa=X&ved=0ahUKEwjukdu71YbOAhVD5mMKHZNFDXQQmxMIkQEoATAR">New Delhi</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=584&q=india+dialing+code&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC7KNtBSzE620s_JT04syczP00_OL80rKaq0SslMzMnMS1dIzk9JBQAWcCsKLwAAAA&sa=X&ved=0ahUKEwjukdu71YbOAhVD5mMKHZNFDXQQ6BMIlAEoADAS">Dialing code</a>: +91</p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=584&q=india+prime+minister&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC7KNtAyz0620k_PL0stystNzStBYibmxGeVFmUWp2Qml2Tm51kVFGXmpirkZuZlFpekFgEAeZSwIkUAAAA&sa=X&ved=0ahUKEwjukdu71YbOAhVD5mMKHZNFDXQQ6BMIlwEoADAT">Prime minister</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=584&q=Narendra+Modi&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC7KNlDiBLGMLM0KjbTMs5Ot9NPzy1KL8nJT80qQmIk58VmlRZnFKZnJJZn5eVYFRZm5qQq5mXmZxSWpRQAlb2X_UAAAAA&sa=X&ved=0ahUKEwjukdu71YbOAhVD5mMKHZNFDXQQmxMImAEoATAT">Narendra Modi</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=584&q=india+president&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC7KNtAyyk620k_PL0stystNzStBYibmxGeVFmUWp2Qml2Tm51kVFKUWZ6YAJQBJQahvQAAAAA&sa=X&ved=0ahUKEwjukdu71YbOAhVD5mMKHZNFDXQQ6BMImwEoADAU">President</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=584&q=Pranab+Mukherjee&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC7KNlDiBLMMDZMKtIyyk6300_PLUovyclPzSpCYiTnxWaVFmcUpmcklmfl5VgVFqcWZKUAJADX1b6ZLAAAA&sa=X&ved=0ahUKEwjukdu71YbOAhVD5mMKHZNFDXQQmxMInAEoATAU">Pranab Mukherjee</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=584&q=india+population&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC7KNtDSyk620s_JT04syczP0y8uAdLFJZnJiTnxRanpQCGrgvyC0hywLADWjGFOOAAAAA&sa=X&ved=0ahUKEwjukdu71YbOAhVD5mMKHZNFDXQQ6BMInwEoADAV">Population</a>: 1.252 billion (2013) <a href="http://data.worldbank.org/indicator/SP.POP.TOTL">World Bank</a> </p>
')
INSERT [dbo].[Countries] ([CountryId], [Name], [About]) VALUES (15, N'Nepal', N'<p><img alt="" src="/Images/nn.png" style="height:160px; width:323px" /></p>

<p>Nepal, officially the Federal Democratic Republic of Nepal, is a landlocked country in South Asia with a population of 26.4 million. It is a multiethnic nation with Nepali as the official langugage. <a href="http://en.wikipedia.org/wiki/Nepal">Wikipedia</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=nepal+capital&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDSrKi_RkslOttLPyU9OLMnMz9NPzi_NKymqtEpOLMgsScwBABfnPuMrAAAA&sa=X&ved=0ahUKEwjT6_Gu1obOAhVNyGMKHQSGBOIQ6BMIiQEoADAP">Capital</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=Kathmandu+Nepal&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDSrKi9R4gAxTZIrTLVkspOt9HPykxNLMvPz9JPzS_NKiiqtkhMLMksScwAPiWFXNQAAAA&sa=X&ved=0ahUKEwjT6_Gu1obOAhVNyGMKHQSGBOIQmxMIigEoATAP">Kathmandu</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=nepal+dialing+code&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDSrKi_RUsxOttLPyU9OLMnMz9NPzi_NKymqtErJTMzJzEtXSM5PSQUAQt7fgzAAAAA&sa=X&ved=0ahUKEwjT6_Gu1obOAhVNyGMKHQSGBOIQ6BMIjQEoADAQ">Dialing code</a>: +977</p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=nepal+prime+minister&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDSrKi_RMs9OttJPzy9LLcrLTc0rQWIm5sRnlRZlFqdkJpdk5udZFRRl5qYq5GbmZRaXpBYBAPRvkMVGAAAA&sa=X&ved=0ahUKEwjT6_Gu1obOAhVNyGMKHQSGBOIQ6BMIkAEoADAR">Prime minister</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=KP+Oli&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDSrKi9R4gIxsywLDcsLtcyzk6300_PLUovyclPzSpCYiTnxWaVFmcUpmcklmfl5VgVFmbmpCrmZeZnFJalFAMajpOpSAAAA&sa=X&ved=0ahUKEwjT6_Gu1obOAhVNyGMKHQSGBOIQmxMIkQEoATAR">Khadga Prasad Oli</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=nepal+president&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDSrKi_RMspOttJPzy9LLcrLTc0rQWIm5sRnlRZlFqdkJpdk5udZFRSlFmemACUA-6V10kEAAAA&sa=X&ved=0ahUKEwjT6_Gu1obOAhVNyGMKHQSGBOIQ6BMIlAEoADAS">President</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=Bidhya+Devi+Bhandari&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDSrKi9R4gIx48uSDIqStYyyk6300_PLUovyclPzSpCYiTnxWaVFmcUpmcklmfl5VgVFqcWZKUAJACYeD4FNAAAA&sa=X&ved=0ahUKEwjT6_Gu1obOAhVNyGMKHQSGBOIQmxMIlQEoATAS">Bidhya Devi Bhandari</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=nepal+currency&stick=H4sIAAAAAAAAAOPgE-LUz9U3MDSrKi_Rks1OttLPyU9OLMnMz9NPzi_NKymqtEouLSpKzUuuBABwqoPpLAAAAA&sa=X&ved=0ahUKEwjT6_Gu1obOAhVNyGMKHQSGBOIQ6BMImAEoADAT">Currency</a>: Nepalese rupee</p>
')
INSERT [dbo].[Countries] ([CountryId], [Name], [About]) VALUES (16, N'Pakistan', N'<p><img alt="" src="/Images/ss.png" style="height:151px; width:227px" /></p>

<p>Pakistan, officially the Islamic Republic of Pakistan, is a country in South Asia. It is the sixth-most populous country with a population exceeding 201 million people. <a href="http://en.wikipedia.org/wiki/Pakistan">Wikipedia</a> </p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=pakistan+capital&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMtSSyU620s_JT04syczP00_OL80rKaq0Sk4syCxJzAEALBwDKioAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQ6BMIiQEoADAR">Capital</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=Islamabad+Pakistan&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMlQCs1IyUky1ZLKTrfRz8pMTSzLz8_ST80vzSooqrZITCzJLEnMABz7HnzQAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQmxMIigEoATAR">Islamabad</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=pakistan+dialing+code&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMtRSzE620s_JT04syczP00_OL80rKaq0SslMzMnMS1dIzk9JBQC33MIyLwAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQ6BMIjQEoADAS">Dialing code</a>: +92</p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=pakistan+national+anthem&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMtRSyU620s_JT04syczP00_OL80rKaq0ygNzE3MUEvNKMlJzAVgC5YkyAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQ6BMIkAEoADAT">National anthem</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=National+Anthem+of+Pakistan&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMlTiBLGMLFOy07RUspOt9HPykxNLMvPz9JPzS_NKiiqt8sDcxByFxLySjNRcAB1mSu49AAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQmxMIkQEoATAT">National Anthem Of Pakistan</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=pakistan+prime+minister&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMtQyz0620k_PL0stystNzStBYibmxGeVFmUWp2Qml2Tm51kVFGXmpirkZuZlFpekFgEAXZu04EUAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQ6BMIlAEoADAU">Prime minister</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=Nawaz+Sharif&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMlTiBLGMDErMjLTMs5Ot9NPzy1KL8nJT80qQmIk58VmlRZnFKZnJJZn5eVYFRZm5qQq5mXmZxSWpRQCPtBgWUAAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQmxMIlQEoATAU">Nawaz Sharif</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=pakistan+president&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMtQyyk620k_PL0stystNzStBYibmxGeVFmUWp2Qml2Tm51kVFKUWZ6YAJQDszoVyQAAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQ6BMImAEoADAV">President</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=Mamnoon+Hussain&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMlTiArHKU_JSSiy0jLKTrfTT88tSi_JyU_NKkJiJOfFZpUWZxSmZySWZ-XlWBUWpxZkpQAkA8inlU0wAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQmxMImQEoATAV">Mamnoon Hussain</a></p>

<p><a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=pakistan+neighboring+countries&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMtTSyyi30k_Oz8lJTS7JzM8DMkvzSooyU4ut8lIz0zOS8osy89IV4KIAqP0h4DwAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQ6BMInAEoADAW">Neighboring countries</a>: <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=India&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMlQCs4yLsg209DLKrfST83NyUpNLMvPzgMzSvJKizNRiq7zUzPSMpPyizLx0BbgoAIYedlpGAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQmxMInQEoATAW">India</a>, <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=China&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMlTiBLFSDEzLjbX0Msqt9JPzc3JSk0sy8_OAzNK8kqLM1GKrvNTM9Iyk_KLMvHQFuCgADnz9bUcAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQmxMIngEoAjAW">China</a>, <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=Afghanistan&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMlRiB7GyUlK09DLKrfST83NyUpNLMvPzgMzSvJKizNRiq7zUzPSMpPyizLx0BbgoANKigTVFAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQmxMInwEoAzAW">Afghanistan</a>, <a href="https://www.google.com.bd/search?espv=2&biw=1366&bih=623&q=Iran&stick=H4sIAAAAAAAAAOPgE-LQz9U3MC1OMlQCs4yLMwq09DLKrfST83NyUpNLMvPzgMzSvJKizNRiq7zUzPSMpPyizLx0BbgoAHC6BshGAAAA&sa=X&ved=0ahUKEwi41Jvx1obOAhULxmMKHSNqB1UQmxMIoAEoBDAW">Iran</a></p>
')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Countries]    Script Date: 7/22/2016 4:04:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Countries] ON [dbo].[Countries]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ci"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "co"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 99
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CitiesViewModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CitiesViewModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[15] 2[25] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "co"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ci"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CountriesViewModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CountriesViewModel'
GO
USE [master]
GO
ALTER DATABASE [CountryCityDB] SET  READ_WRITE 
GO
