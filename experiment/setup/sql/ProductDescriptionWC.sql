-- infoviz.ProductDescriptionWC definition

CREATE TABLE infoviz.ProductDescriptionWC
(
    word varchar(50),
    count int
);


CREATE PROJECTION infoviz.ProductDescriptionWC_super /*+basename(ProductDescriptionWC),createtype(L)*/ 
(
 word,
 count
)
AS
 SELECT ProductDescriptionWC.word,
        ProductDescriptionWC.count
 FROM infoviz.ProductDescriptionWC
 ORDER BY ProductDescriptionWC.word,
          ProductDescriptionWC.count
SEGMENTED BY hash(ProductDescriptionWC.count, ProductDescriptionWC.word) ALL NODES OFFSET 0;


SELECT MARK_DESIGN_KSAFE(0);