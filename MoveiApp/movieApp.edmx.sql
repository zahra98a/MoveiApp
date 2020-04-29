
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/26/2020 19:22:54
-- Generated from EDMX file: H:\OOD\MoveiApp\MoveiApp\movieApp.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [movieApp];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_MovieMovieType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Movies] DROP CONSTRAINT [FK_MovieMovieType];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Movies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Movies];
GO
IF OBJECT_ID(N'[dbo].[MovieTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MovieTypes];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Movies'
CREATE TABLE [dbo].[Movies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [RunningTime] time  NOT NULL,
    [Ratting] float  NOT NULL,
    [Establish] datetime  NOT NULL,
    [image] nvarchar(max)  NOT NULL,
    [MovieType_Id] int  NOT NULL
);
GO

-- Creating table 'MovieTypes'
CREATE TABLE [dbo].[MovieTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [type] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Movies'
ALTER TABLE [dbo].[Movies]
ADD CONSTRAINT [PK_Movies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MovieTypes'
ALTER TABLE [dbo].[MovieTypes]
ADD CONSTRAINT [PK_MovieTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MovieType_Id] in table 'Movies'
ALTER TABLE [dbo].[Movies]
ADD CONSTRAINT [FK_MovieMovieType]
    FOREIGN KEY ([MovieType_Id])
    REFERENCES [dbo].[MovieTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MovieMovieType'
CREATE INDEX [IX_FK_MovieMovieType]
ON [dbo].[Movies]
    ([MovieType_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------