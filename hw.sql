CREATE TABLE CodingExams (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    CandidateID INT NOT NULL,
    CandidateName VARCHAR(100) NOT NULL,
    Score INT NOT NULL CHECK (Score >= 0), 
    MaxScore INT NOT NULL CHECK (MaxScore > 0), 
    ExamDate DATE NOT NULL
);

INSERT INTO CodingExams (CandidateID, CandidateName, Score, MaxScore, ExamDate) VALUES
(1, 'Steve Rogers', 85, 100, '2024-11-20'),
(2, 'Natasha Romanoff', 72, 100, '2024-11-22'),
(3, 'Clint Barton', 65, 100, '2024-11-21'),
(4, 'Bruce Banner', 45, 100, '2024-11-19'),
(5, 'Tony Stark', 90, 100, '2024-11-18'),
(6, 'Thor Odinson', 60, 100, '2024-11-23');

SELECT CandidateID, CandidateName, Score
FROM CodingExams
WHERE Score > 70;

SELECT 
    CASE 
        WHEN Score >= 70 THEN 'Above 70'
        WHEN Score >= 50 AND Score < 70 THEN 'Between 50 and 69'
        ELSE 'Below 50'
    END AS ScoreRange,
    COUNT(*) AS TotalCandidates
FROM CodingExams
GROUP BY ScoreRange;

SELECT CandidateID, CandidateName, Score AS HighestScore
FROM CodingExams
WHERE Score = (SELECT MAX(Score) FROM CodingExams);

SELECT CandidateID, CandidateName, Score, 
       RANK() OVER (ORDER BY Score DESC) AS Rank
FROM CodingExams;

SELECT CandidateID, CandidateName, 
       ROUND((Score * 100.0 / MaxScore), 2) AS Percentage
FROM CodingExams;

SELECT CandidateID, CandidateName, Score
FROM CodingExams
WHERE Score BETWEEN 50 AND 69;
