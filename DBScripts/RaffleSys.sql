/****** Object:  Table [dbo].[DrawSets]    Script Date: 9/16/2020 10:51:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrawSets](
	[SetID] [int] IDENTITY(1,1) NOT NULL,
	[DateDraw] [datetime] NOT NULL,
	[NoOfWinners] [int] NOT NULL,
 CONSTRAINT [PK_DrawSets] PRIMARY KEY CLUSTERED 
(
	[SetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/16/2020 10:51:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [nvarchar](150) NOT NULL,
	[ForGrandPrize] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Winners]    Script Date: 9/16/2020 10:51:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Winners](
	[WinnerID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[SetID] [int] NOT NULL,
 CONSTRAINT [PK_Winners] PRIMARY KEY CLUSTERED 
(
	[WinnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DrawSets] ADD  CONSTRAINT [DF_DrawSets_DateDraw]  DEFAULT (getdate()) FOR [DateDraw]
GO
ALTER TABLE [dbo].[Winners]  WITH CHECK ADD  CONSTRAINT [FK_Winners_DrawSets] FOREIGN KEY([SetID])
REFERENCES [dbo].[DrawSets] ([SetID])
GO
ALTER TABLE [dbo].[Winners] CHECK CONSTRAINT [FK_Winners_DrawSets]
GO
ALTER TABLE [dbo].[Winners]  WITH CHECK ADD  CONSTRAINT [FK_Winners_Employees] FOREIGN KEY([ID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Winners] CHECK CONSTRAINT [FK_Winners_Employees]
GO
