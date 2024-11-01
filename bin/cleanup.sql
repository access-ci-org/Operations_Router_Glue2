\t on

/* Children before parents */
\qecho Purging older than 28 days from public.glue2_abstractservice
delete from public.glue2_abstractservice
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_abstractservice;

/* Children before parents */
\qecho Purging older than 28 days from public.glue2_applicationhandle
delete from public.glue2_applicationhandle
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_applicationhandle;

\qecho Purging older than 28 days from public.glue2_applicationenvironment
delete from public.glue2_applicationenvironment
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_applicationenvironment;

/* These don't have children/parents */
\qecho Purging older than 28 days from public.glue2_acceleratorenvironment
delete from public.glue2_acceleratorenvironment
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_acceleratorenvironment;

\qecho Purging older than 28 days from public.glue2_accesspolicy
delete from public.glue2_accesspolicy
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_accesspolicy;

\qecho Purging older than 28 days from public.glue2_admindomain
delete from public.glue2_admindomain
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_admindomain;

\qecho Purging older than 28 days from public.glue2_computingactivity
delete from public.glue2_computingactivity
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_computingactivity;

\qecho Purging older than 28 days from public.glue2_computingmanager
delete from public.glue2_computingmanager
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_computingmanager;

\qecho Purging older than 28 days from public.glue2_computingmanageracceleratorinfo
delete from public.glue2_computingmanageracceleratorinfo
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_computingmanageracceleratorinfo;

\qecho Purging older than 28 days from public.glue2_computingqueue
delete from public.glue2_computingqueue
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_computingqueue;

\qecho Purging older than 28 days from public.glue2_computingshare
delete from public.glue2_computingshare
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_computingshare;

\qecho Purging older than 28 days from public.glue2_computingshareacceleratorinfo
delete from public.glue2_computingshareacceleratorinfo
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_computingshareacceleratorinfo;

\qecho Purging older than 28 days from public.glue2_contact
delete from public.glue2_contact
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_contact;

\qecho Purging older than 28 days from public.glue2_endpoint
delete from public.glue2_endpoint
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_endpoint;

\qecho Purging older than 28 days from public.glue2_executionenvironment
delete from public.glue2_executionenvironment
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_executionenvironment;

\qecho Purging older than 28 days from public.glue2_location
delete from public.glue2_location
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_location;

\qecho Purging older than 28 days from public.glue2_userdomain
delete from public.glue2_userdomain
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze public.glue2_userdomain;

\qecho Purging older from public.glue2_entityhistory
delete from public.glue2_entityhistory
    where "DocumentType"='glue2.computing_activities' and "ReceivedTime" < current_timestamp - interval '3 days';
delete from public.glue2_entityhistory
    where "DocumentType"='glue2.compute' and "ReceivedTime" < current_timestamp - interval '7 days';
delete from public.glue2_entityhistory
    where "DocumentType"='glue2.applications' and "ReceivedTime" < current_timestamp - interval '7 days';
vacuum analyze public.monitoring_db_testresult;
