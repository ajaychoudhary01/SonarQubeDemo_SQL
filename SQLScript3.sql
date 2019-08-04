-- find out the final step for each project
WITH FinalStep AS
(
    SELECT ProjectId, MAX(WorkflowStep) as MaxWorkflowStep
    FROM WorkflowHistory
    WHERE WorkflowStep > 1
    GROUP BY ProjectId
)
SELECT
    p.ProjectId,
    p.Title,
    -- this is ugly consider creating a scalar function to encapsulate it
    STUFF (
           (SELECT ', ' + f.Name
            FROM dbo.Facility f
            LEFT JOIN dbo.ProjectFacility pf ON f.FacilityId = pf.FacilityId
            WHERE pf.ProjectId = p.ProjectId
            FOR XML PATH (''))
            , 1, 1, '') AS Facilities,
    wf1.ActionedOn AS Recieved,
    wf2.ActionedOn AS Concluded,
    b.BranchName,
    st.Description AS StatusText,
    wf2.Comment,
    wf2.ActionedOn - w1.ActionedOn AS Turnaround
FROM
    Project p
    INNER JOIN WorkflowHistory wf1 
        ON p.ProjectId = wf1.ProjectId 
        AND wf1.WorkflowStep = 1
    LEFT JOIN FinalStep fs 
        ON fs.ProjectId = p.ProjectId
    LEFT JOIN WorkflowHistory wf2 
        ON p.ProjectId = wf2.ProjectId 
        AND wf2.WorkflowStep = fs.MaxWorkflowStep
    INNER JOIN ProjectBranch pb 
        ON pb.ProjectId = p.ProjectId
    LEFT JOIN dbo.Branch b 
        ON pb.BranchId = b.BranchId
    LEFT JOIN dbo.Status st 
        ON p.StatusId = st.StatusId
WHERE
    p.ProjectId = w.ProjectId
    -- IF @StatusId = 0 THEN p.StatusId = 5 or 6 or 7 ELSE p.StatusId = @StatusId
    AND ((@StatusId = 0 AND p.StatusId IN (5,6,7)) OR p.StatusId = @StatusId)
    -- IF @BranchId = 0 THEN no filter ELSE pb.BranchId = @BranchId
    AND (@BranchId = 0 OR pb.BranchId = @BranchId)
    AND (wf1.ActionedOn BETWEEN @FromDate AND @ToDate)