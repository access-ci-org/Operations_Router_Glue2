\t on

/* Children before parents */
\qecho Purging older than 28 days from info_django.glue2_abstractservice
delete from info_django.glue2_abstractservice
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_abstractservice;

/* Children before parents */
\qecho Purging older than 28 days from info_django.glue2_applicationhandle
delete from info_django.glue2_applicationhandle
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_applicationhandle;

\qecho Purging older than 28 days from info_django.glue2_applicationenvironment
delete from info_django.glue2_applicationenvironment
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_applicationenvironment;

/* These don't have children/parents */
\qecho Purging older than 28 days from info_django.glue2_acceleratorenvironment
delete from info_django.glue2_acceleratorenvironment
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_acceleratorenvironment;

\qecho Purging older than 28 days from info_django.glue2_accesspolicy
delete from info_django.glue2_accesspolicy
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_accesspolicy;

\qecho Purging older than 28 days from info_django.glue2_admindomain
delete from info_django.glue2_admindomain
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_admindomain;

\qecho Purging older than 28 days from info_django.glue2_computingactivity
delete from info_django.glue2_computingactivity
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_computingactivity;

\qecho Purging older than 28 days from info_django.glue2_computingmanager
delete from info_django.glue2_computingmanager
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_computingmanager;

\qecho Purging older than 28 days from info_django.glue2_computingmanageracceleratorinfo
delete from info_django.glue2_computingmanageracceleratorinfo
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_computingmanageracceleratorinfo;

\qecho Purging older than 28 days from info_django.glue2_computingqueue
delete from info_django.glue2_computingqueue
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_computingqueue;

\qecho Purging older than 28 days from info_django.glue2_computingshare
delete from info_django.glue2_computingshare
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_computingshare;

\qecho Purging older than 28 days from info_django.glue2_computingshareacceleratorinfo
delete from info_django.glue2_computingshareacceleratorinfo
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_computingshareacceleratorinfo;

\qecho Purging older than 28 days from info_django.glue2_contact
delete from info_django.glue2_contact
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_contact;

\qecho Purging older than 28 days from info_django.glue2_endpoint
delete from info_django.glue2_endpoint
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_endpoint;

\qecho Purging older than 28 days from info_django.glue2_executionenvironment
delete from info_django.glue2_executionenvironment
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_executionenvironment;

\qecho Purging older than 28 days from info_django.glue2_location
delete from info_django.glue2_location
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_location;

\qecho Purging older than 28 days from info_django.glue2_userdomain
delete from info_django.glue2_userdomain
  where "CreationTime" < current_timestamp - interval '28 days';
vacuum analyze info_django.glue2_userdomain;

\qecho Purging older from info_django.glue2_entityhistory
delete from info_django.glue2_entityhistory
    where "DocumentType"='glue2.computing_activities' and "ReceivedTime" < current_timestamp - interval '3 days';
delete from info_django.glue2_entityhistory
    where "DocumentType"='glue2.compute' and "ReceivedTime" < current_timestamp - interval '7 days';
delete from info_django.glue2_entityhistory
    where "DocumentType"='glue2.applications' and "ReceivedTime" < current_timestamp - interval '7 days';
vacuum analyze info_django.glue2_entityhistory;
