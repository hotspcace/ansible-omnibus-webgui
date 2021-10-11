alter table alerts.status add column VnoId varchar(1024);
go

--begin
 --      if (alerts.col_visuals.Colname = 'PROBE') or
   --        (%user.app_name = 'PROXY') then
    --            set row old = new;
     --           set old.ConnectionID = %user.connection_id;
      --          set old.LastUpdate = getdate;
       -- elseif (%user.app_name = 'GATEWAY') and
       --        (new.LastUpdate > old.LastUpdate) then
       --         -- Only update the registry if the reinsert is more recent
       --         set row old = new;
       -- else
       --         cancel;
       -- end if;
--end;
--go
