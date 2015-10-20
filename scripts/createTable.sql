create database weather;

create table weather.rainfall (
id INT PRIMARY KEY AUTO_INCREMENT,
iid INT,
minutes_past INT,
radardist_km DOUBLE,
Ref DOUBLE,
Ref_5x5_10th DOUBLE,
Ref_5x5_50th DOUBLE,
Ref_5x5_90th DOUBLE,
RefComposite DOUBLE,
RefComposite_5x5_10th DOUBLE,
RefComposite_5x5_50th DOUBLE,
RefComposite_5x5_90th DOUBLE,
RhoHV DOUBLE,
RhoHV_5x5_10th DOUBLE,
RhoHV_5x5_50th DOUBLE,
RhoHV_5x5_90th DOUBLE,
Zdr DOUBLE,
Zdr_5x5_10th DOUBLE,
Zdr_5x5_50th DOUBLE,
Zdr_5x5_90th DOUBLE,
Kdp DOUBLE,
Kdp_5x5_10th DOUBLE,
Kdp_5x5_50th DOUBLE,
Kdp_5x5_90th DOUBLE,
Expected DOUBLE
);