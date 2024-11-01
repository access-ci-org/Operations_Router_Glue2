\t on

/* Children before parents */
\qecho Purging older than 28 days from public.glue2_db_endpoint
delete from public.glue2_db_endpoint
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_endpoint;

\qecho Purging older than 28 days from public.glue2_db_abstractservice
delete from public.glue2_db_abstractservice
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_abstractservice;

/* Children before parents */
\qecho Purging older than 28 days from public.glue2_db_applicationhandle
delete from public.glue2_db_applicationhandle
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_applicationhandle;

\qecho Purging older than 28 days from public.glue2_db_applicationenvironment
delete from public.glue2_db_applicationenvironment
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_applicationenvironment;

/* These don't have children/parents */
\qecho Purging older than 28 days from public.glue2_db_acceleratorenvironment
delete from public.glue2_db_acceleratorenvironment
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_acceleratorenvironment;

\qecho Purging older than 28 days from public.glue2_db_accesspolicy
delete from public.glue2_db_accesspolicy
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_accesspolicy;

\qecho Purging older than 28 days from public.glue2_db_admindomain
delete from public.glue2_db_admindomain
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_admindomain;

\qecho Purging older than 28 days from public.glue2_db_computingactivity
delete from public.glue2_db_computingactivity
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_computingactivity;

\qecho Purging older than 28 days from public.glue2_db_computingmanager
delete from public.glue2_db_computingmanager
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_computingmanager;

\qecho Purging older than 28 days from public.glue2_db_computingmanageracceleratorinfo
delete from public.glue2_db_computingmanageracceleratorinfo
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_computingmanageracceleratorinfo;

\qecho Purging older than 28 days from public.glue2_db_computingqueue
delete from public.glue2_db_computingqueue
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_computingqueue;

\qecho Purging older than 28 days from public.glue2_db_computingshare
delete from public.glue2_db_computingshare
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_computingshare;

\qecho Purging older than 28 days from public.glue2_db_computingshareacceleratorinfo
delete from public.glue2_db_computingshareacceleratorinfo
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_computingshareacceleratorinfo;

\qecho Purging older than 28 days from public.glue2_db_contact
delete from public.glue2_db_contact
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_contact;

\qecho Purging older than 28 days from public.glue2_db_executionenvironment
delete from public.glue2_db_executionenvironment
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_executionenvironment;

\qecho Purging older than 28 days from public.glue2_db_location
delete from public.glue2_db_location
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_location;

\qecho Purging older than 28 days from public.glue2_db_userdomain
delete from public.glue2_db_userdomain
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_db_userdomain;

\qecho Purging older than 28 days from public.monitoring_db_testresult
delete from public.monitoring_db_testresult
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.monitoring_db_testresult;

\qecho Purging older from public.glue2_db_entityhistory
delete from public.glue2_entityhistory
    where "DocumentType"='glue2.computing_activities' and "ReceivedTime" < current_timestamp - interval '3 days';
delete from public.glue2_entityhistory
    where "DocumentType"='glue2.compute' and "ReceivedTime" < current_timestamp - interval '7 days';
delete from public.glue2_entityhistory
    where "DocumentType"='glue2.applications' and "ReceivedTime" < current_timestamp - interval '7 days';
vacuum analyze public.monitoring_db_testresult;
