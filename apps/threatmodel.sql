--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Cl6gfVBuDnUArtsUT/vN4w==$FMmEOpBd5Gssu3XYC3I74fvm9FjP/bYQl7e64a2CNcY=:voMKU30hgxFkaOgy2xUp2KlqrcUlEaiagXuEz4ZEuc4=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: cardgame; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cardgame;


ALTER SCHEMA cardgame OWNER TO postgres;

--
-- Name: threatmodel; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA threatmodel;


ALTER SCHEMA threatmodel OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: card; Type: TABLE; Schema: cardgame; Owner: postgres
--

CREATE TABLE cardgame.card (
    rank character varying(2) NOT NULL,
    description text,
    suit text NOT NULL
);


ALTER TABLE cardgame.card OWNER TO postgres;

--
-- Name: card_game; Type: TABLE; Schema: cardgame; Owner: postgres
--

CREATE TABLE cardgame.card_game (
    name text NOT NULL
);


ALTER TABLE cardgame.card_game OWNER TO postgres;

--
-- Name: rank_order; Type: TABLE; Schema: cardgame; Owner: postgres
--

CREATE TABLE cardgame.rank_order (
    rank text NOT NULL,
    rank_name text NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE cardgame.rank_order OWNER TO postgres;

--
-- Name: suit; Type: TABLE; Schema: cardgame; Owner: postgres
--

CREATE TABLE cardgame.suit (
    name text NOT NULL,
    "card_gameName" text NOT NULL
);


ALTER TABLE cardgame.suit OWNER TO postgres;

--
-- Name: suit_order; Type: TABLE; Schema: cardgame; Owner: postgres
--

CREATE TABLE cardgame.suit_order (
    suit_name text,
    "order" integer
);


ALTER TABLE cardgame.suit_order OWNER TO postgres;

--
-- Name: asset; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.asset (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.asset OWNER TO postgres;

--
-- Name: assetvalue; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.assetvalue (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.assetvalue OWNER TO postgres;

--
-- Name: lifecycle; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.lifecycle (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.lifecycle OWNER TO postgres;

--
-- Name: part; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.part (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description text
);


ALTER TABLE threatmodel.part OWNER TO postgres;

--
-- Name: repolink; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.repolink (
    repo character varying(512) NOT NULL,
    teamid integer NOT NULL
);


ALTER TABLE threatmodel.repolink OWNER TO postgres;

--
-- Name: team; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.team (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE threatmodel.team OWNER TO postgres;

--
-- Name: threat; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.threat (
    "ID" integer NOT NULL,
    registrationdate date NOT NULL,
    updateddate date,
    owner character varying(250),
    synopsis text NOT NULL,
    note text,
    assetid integer NOT NULL,
    download_url character varying(250),
    git_url character varying(250)
);


ALTER TABLE threatmodel.threat OWNER TO postgres;

--
-- Name: threatactor; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.threatactor (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.threatactor OWNER TO postgres;

--
-- Name: threatclass; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.threatclass (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.threatclass OWNER TO postgres;

--
-- Name: threatdefence; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.threatdefence (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.threatdefence OWNER TO postgres;

--
-- Name: threatoccurence; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.threatoccurence (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.threatoccurence OWNER TO postgres;

--
-- Name: threatrating; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.threatrating (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.threatrating OWNER TO postgres;

--
-- Name: threatseverity; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.threatseverity (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.threatseverity OWNER TO postgres;

--
-- Name: threattype; Type: TABLE; Schema: threatmodel; Owner: postgres
--

CREATE TABLE threatmodel.threattype (
    id integer NOT NULL,
    value character varying(250) NOT NULL,
    "order" integer
);


ALTER TABLE threatmodel.threattype OWNER TO postgres;

--
-- Data for Name: card; Type: TABLE DATA; Schema: cardgame; Owner: postgres
--

INSERT INTO cardgame.card VALUES ('2', 'An attacker could take over the port or socket that the server normally uses.', 'Spoofing');
INSERT INTO cardgame.card VALUES ('3', 'An attacker could try one credential after another and there''s nothing to slow them down (online or offline)', 'Spoofing');
INSERT INTO cardgame.card VALUES ('4', 'An attacker can anonymously connect, because we expect authentication to be done at a higher level', 'Spoofing');
INSERT INTO cardgame.card VALUES ('5', 'An attacker can confuse a client because there are too many ways to identify a server', 'Spoofing');
INSERT INTO cardgame.card VALUES ('6', 'An attacker can spoof a server because identifiers aren''t stored on the client and checked for consistency on re-connection (that is, there''s no key persistence)', 'Spoofing');
INSERT INTO cardgame.card VALUES ('7', 'An attacker can connect to a server or peer over a link that isn''t authenticated (and encrypted)', 'Spoofing');
INSERT INTO cardgame.card VALUES ('8', 'An attacker could steal credentials stored on the server and reuse them (for example, a key is stored in a world readable file)', 'Spoofing');
INSERT INTO cardgame.card VALUES ('9', 'An attacker who gets a password can reuse it (Use stronger authenticators)', 'Spoofing');
INSERT INTO cardgame.card VALUES ('10', 'An attacker can choose to use weaker or no authentication', 'Spoofing');
INSERT INTO cardgame.card VALUES ('J', 'An attacker could steal credentials stored on the client and reuse them', 'Spoofing');
INSERT INTO cardgame.card VALUES ('Q', 'An attacker could go after the way credentials are updated or recovered (account recovery doesn''t require disclosing the old password)', 'Spoofing');
INSERT INTO cardgame.card VALUES ('K', 'Your system ships with a default admin password, and doesn''t force a change', 'Spoofing');
INSERT INTO cardgame.card VALUES ('A', 'You''ve invented a new Spoofing attack', 'Spoofing');
INSERT INTO cardgame.card VALUES ('2', 'An attacker can modify your build system and produce signed builds of your software', 'Tampering');
INSERT INTO cardgame.card VALUES ('3', 'An attacker can take advantage of your custom key exchange or integrity control which you built instead of using standard crypto', 'Tampering');
INSERT INTO cardgame.card VALUES ('4', 'Your code makes access control decisions all over the place, rather than with a security kernel', 'Tampering');
INSERT INTO cardgame.card VALUES ('5', 'An attacker can replay data without detection because your code doesn''t provide timestamps or sequence numbers', 'Tampering');
INSERT INTO cardgame.card VALUES ('6', 'An attacker can write to a data store your code relies on', 'Tampering');
INSERT INTO cardgame.card VALUES ('7', 'An attacker can bypass permissions because you don''t make names canonical before checking access permissions', 'Tampering');
INSERT INTO cardgame.card VALUES ('8', 'An attacker can manipulate data because there''s no integrity protection for data on the network', 'Tampering');
INSERT INTO cardgame.card VALUES ('9', 'An attacker can provide or control state information', 'Tampering');
INSERT INTO cardgame.card VALUES ('10', 'An attacker can alter information in a data store because it has weak/open permissions or includes a group which is equivalent to everyone (\"anyone with a Facebook account\")', 'Tampering');
INSERT INTO cardgame.card VALUES ('J', 'An attacker can write to some resource because permissions are granted to the world or there are no ACLs', 'Tampering');
INSERT INTO cardgame.card VALUES ('Q', 'An attacker can change parameters over a trust boundary and after validation (for example, important parameters in a hidden field in HTML, or passing a pointer to critical memory)', 'Tampering');
INSERT INTO cardgame.card VALUES ('K', 'An attacker can load code inside your process via an extension point', 'Tampering');
INSERT INTO cardgame.card VALUES ('A', 'You''ve invented a new Tampering attack', 'Tampering');
INSERT INTO cardgame.card VALUES ('2', 'An attacker can pass data through the log to attack a log reader, and there''s no documentation of what sorts of validation are done', 'Repudiation');
INSERT INTO cardgame.card VALUES ('3', 'A low privilege attacker can read interesting security information in the logs', 'Repudiation');
INSERT INTO cardgame.card VALUES ('4', 'An attacker can alter digital signatures because the digital signature system you''re implementing is weak, or uses MACs where it should use a signature', 'Repudiation');
INSERT INTO cardgame.card VALUES ('5', 'An attacker can alter log messages on a network because they lack strong integrity controls', 'Repudiation');
INSERT INTO cardgame.card VALUES ('6', 'An attacker can create a log entry without a timestamp (or no log entry is timestamped)', 'Repudiation');
INSERT INTO cardgame.card VALUES ('7', 'An attacker can make the logs wrap around and lose data', 'Repudiation');
INSERT INTO cardgame.card VALUES ('8', 'An attacker can make a log lose or confuse security information', 'Repudiation');
INSERT INTO cardgame.card VALUES ('9', 'An attacker can use a shared key to authenticate as different principals, confusing the information in the logs', 'Repudiation');
INSERT INTO cardgame.card VALUES ('10', 'An attacker can get arbitrary data into logs from unauthenticated (or weakly authenticated) outsiders without validation', 'Repudiation');
INSERT INTO cardgame.card VALUES ('J', 'An attacker can edit logs and there''s no way to tell (perhaps because there''s no heartbeat option for the logging system)', 'Repudiation');
INSERT INTO cardgame.card VALUES ('Q', 'An attacker can say "I didn''t do that," and you''d have no way to prove them wrong', 'Repudiation');
INSERT INTO cardgame.card VALUES ('K', 'The system has no logs', 'Repudiation');
INSERT INTO cardgame.card VALUES ('A', 'You''ve invented a new Repudiation attack', 'Repudiation');
INSERT INTO cardgame.card VALUES ('2', 'An attacker can brute-force file encryption because there''s no defense in place (example defense, password stretching)', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('3', 'An attacker can see error messages with security sensitive content', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('4', 'An attacker can read content because messages (say, an email or HTTP cookie) aren''t encrypted even if the channel is encrypted', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('5', 'An attacker may be able to read a document or data because it''s encrypted with a non-standard algorithm', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('6', 'An attacker can read data because it''s hidden or occluded (for undo or change tracking) and the user might forget that it''s there', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('7', 'An attacker can act as a ''man in the middle'' because you don''t authenticate endpoints of a network connection', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('8', 'An attacker can access information through a search indexer, logger, or other such mechanism', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('9', 'An attacker can read sensitive information in a file with permissive permissions', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('10', 'An attacker can read information in files or databases with no access controls', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('J', 'An attacker can discover the fixed key being used to encrypt', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('Q', 'An attacker can read the entire channel because the channel (say, HTTP or SMTP) isn''t encrypted', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('K', 'An attacker can read network information because there''s no cryptography used', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('A', 'You''ve invented a new Information Disclosure attack', 'Information disclosure');
INSERT INTO cardgame.card VALUES ('2', 'An attacker can make your authentication system unusable or unavailable', 'Denial of service');
INSERT INTO cardgame.card VALUES ('3', 'An attacker can drain our easily replacable battery (battery, temporary)', 'Denial of service');
INSERT INTO cardgame.card VALUES ('4', 'An attacker can drain a battery that''s hard to replace (sealed in a phone, an implanted medical device, or in a hard to reach location) (battery, persist)', 'Denial of service');
INSERT INTO cardgame.card VALUES ('5', 'An attacker can spend our cloud budget (budget, persist)', 'Denial of service');
INSERT INTO cardgame.card VALUES ('6', 'An attacker can make a server unavailable or unusable without ever authenticating but the problem goes away when the attacker stops (server, anonymous, temporary)', 'Denial of service');
INSERT INTO cardgame.card VALUES ('7', 'An attacker can make a client unavailable or unusable and the problem persists after the attacker goes away (client, auth, persist)', 'Denial of service');
INSERT INTO cardgame.card VALUES ('8', 'An attacker can make a server unavailable or unusable and the problem persists after the attacker goes away (server, auth, persist)', 'Denial of service');
INSERT INTO cardgame.card VALUES ('9', 'An attacker can make a client unavailable or unusable without ever authenticating and the problem persists after the attacker goes away (client, anon, persist)', 'Denial of service');
INSERT INTO cardgame.card VALUES ('10', 'An attacker can make a server unavailable or unusable without ever authenticating and the problem persists after the attacker goes away (server, anon, persist)', 'Denial of service');
INSERT INTO cardgame.card VALUES ('J', 'An attacker can cause the logging subsystem to stop working', 'Denial of service');
INSERT INTO cardgame.card VALUES ('Q', 'An attacker can amplify a Denial of Service attack through this component with amplification on the order of 10 to 1', 'Denial of service');
INSERT INTO cardgame.card VALUES ('K', 'An attacker can amplify a Denial of Service attack through this component with amplification on the order of 100 to 1', 'Denial of service');
INSERT INTO cardgame.card VALUES ('A', 'You''ve invented a new Denial of Service attack', 'Denial of service');
INSERT INTO cardgame.card VALUES ('2', 'An attacker has compromised a key technology supplier', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('3', 'An attacker can access the cloud service which manages your devices', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('4', 'An attacker can escape from a container or other sandbox', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('5', 'An attacker can force data through different validation paths which give different results', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('6', 'An attacker could take advantage of permissions you set, but don''t use', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('7', 'An attacker can provide a pointer across a trust boundary, rather than data which can be validated', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('8', 'An attacker can enter data that is checked while still under their control and used later on the other side of a trust boundary', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('9', 'There''s no reasonable way for a caller to figure out what validation of tainted data you perform before passing it to them', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('10', 'There''s no reasonable way for a caller to figure out what security assumptions you make', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('J', 'An attacker can reflect input back to a user, like cross site scripting', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('Q', 'You include user-generated content within your page, possibly including the content of random URLs', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('K', 'An attacker can inject a command that the system will run at a higher privilege level', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('A', 'You''ve invented a new Elevation of Privilege attack', 'Elevation of privilege');
INSERT INTO cardgame.card VALUES ('2', 'The application uses an API which makes them our data processor, but we don''t know whether this is reflected in our API contract.', 'Transport');
INSERT INTO cardgame.card VALUES ('3', 'We provide an API that ingests personal data, but we dont know whether we are a data processor or a data controller, and its not defined in our contracts.', 'Transport');
INSERT INTO cardgame.card VALUES ('4', 'We call an API with personal data, but we do not jnuw where the API os being hosted geographically.', 'Transport');
INSERT INTO cardgame.card VALUES ('5', 'We export a database dump by writing a CSV file on an FTP site. What happens to the file after it has been downloaded is not our problem.', 'Transport');
INSERT INTO cardgame.card VALUES ('6', 'Some of our systems are hosted outside the EU, but the service provider says that they take security very seriously, so that''s fine.<F4>', 'Transport');
INSERT INTO cardgame.card VALUES ('7', 'Our systems are being administered outside the EU, but admin access is not personal data access, right? Right?', 'Transport');
INSERT INTO cardgame.card VALUES ('8', 'We send personal data over email, but only within the company, so that should be fine, right?', 'Transport');
INSERT INTO cardgame.card VALUES ('9', 'We provide an API to access personal data, and we do not control who can access this API.', 'Transport');
INSERT INTO cardgame.card VALUES ('10', '', 'Transport');
INSERT INTO cardgame.card VALUES ('J', '', 'Transport');
INSERT INTO cardgame.card VALUES ('Q', '', 'Transport');
INSERT INTO cardgame.card VALUES ('K', '', 'Transport');
INSERT INTO cardgame.card VALUES ('A', 'You have identified a new data flow from your system.', 'Transport');
INSERT INTO cardgame.card VALUES ('2', 'Users'' file uploads containing personal data are saved to temp files on the front-end.', 'Retention');
INSERT INTO cardgame.card VALUES ('3', 'All personal data goes into a large pile in the cloud, and going through it to find individual records would cost a fortune in retreival and outbound data transfer fees.', 'Retention');
INSERT INTO cardgame.card VALUES ('4', 'We store personal data on disk, even though we only need it temporarily and could just cache it in memory.', 'Retention');
INSERT INTO cardgame.card VALUES ('5', 'When chaning data, we retain all old data in order to be able to show what has been changed.', 'Retention');
INSERT INTO cardgame.card VALUES ('6', 'The personal data is stored on a blockchain. We can''t delete it at all.', 'Retention');
INSERT INTO cardgame.card VALUES ('7', 'Consent is a checkbox, but to withdraw the consent you need to email us.', 'Retention');
INSERT INTO cardgame.card VALUES ('8', 'We have not defined a specific retention time for pesonal data, but we can delete it if someone asks us to.', 'Retention');
INSERT INTO cardgame.card VALUES ('9', 'Yes, we have defined a retention time for pesonal data - it''s defined bt the IT department based on disk space usage.', 'Retention');
INSERT INTO cardgame.card VALUES ('10', 'We cannot remove personal data as the database schema require the data to be there.', 'Retention');
INSERT INTO cardgame.card VALUES ('J', 'We have defined a retention time for personal data, but that''s only a policy. There is no technolichal system that enforces it.', 'Retention');
INSERT INTO cardgame.card VALUES ('Q', '', 'Retention');
INSERT INTO cardgame.card VALUES ('K', '', 'Retention');
INSERT INTO cardgame.card VALUES ('A', 'You have found a new personal data storage location that you did not know existed.', 'Retention');
INSERT INTO cardgame.card VALUES ('2', 'We use a common identifier across all the systems, and also expose this to tird parties.', 'Inference');
INSERT INTO cardgame.card VALUES ('3', 'Our geolocation data is as accurate as possible, even if we really only need tp know which city the user is from.', 'Inference');
INSERT INTO cardgame.card VALUES ('4', 'We use our users'' names or email addresses as reference keys between systems, even if we could use random identifiers.', 'Inference');
INSERT INTO cardgame.card VALUES ('5', 'We use national ID numbers or SSNs as they are conveniently unique.', 'Inference');
INSERT INTO cardgame.card VALUES ('6', 'We use identifiers in our web links. These identifiers leak in browsers'' referrer headers and get logged by redirectors and URL shorteners.', 'Inference');
INSERT INTO cardgame.card VALUES ('7', 'There is no review process for introducing new advertising providers on the web pages; whatever our designers like, or marketing sells, will be used.', 'Inference');
INSERT INTO cardgame.card VALUES ('8', 'Our telemetry is tied to the users, even though our analytics couldn''t care less who the user actually is.', 'Inference');
INSERT INTO cardgame.card VALUES ('9', 'A neural network makes customer-related decisions, but nobody can really explain to the customers what the model is based on.', 'Inference');
INSERT INTO cardgame.card VALUES ('10', 'We do not make any checks to pesonal data before we use it for training machine learning models.', 'Inference');
INSERT INTO cardgame.card VALUES ('J', '', 'Inference');
INSERT INTO cardgame.card VALUES ('Q', '', 'Inference');
INSERT INTO cardgame.card VALUES ('K', '', 'Inference');
INSERT INTO cardgame.card VALUES ('A', 'You found a new place where we can replace personal data with a random identifier.', 'Inference');
INSERT INTO cardgame.card VALUES ('2', 'We put absolutely everything in the audit log, so we can positively audit all personal data activities.', 'Minimisation');
INSERT INTO cardgame.card VALUES ('3', 'Our testing data is mont-old copy from production. Fake data just does not have the same feel to it.', 'Minimisation');
INSERT INTO cardgame.card VALUES ('4', 'Our website does not worj at all with an ad blocker.', 'Minimisation');
INSERT INTO cardgame.card VALUES ('5', 'We send personal data to an API even though we believe it is really not being used for anything.', 'Minimisation');
INSERT INTO cardgame.card VALUES ('6', 'We''ll just block EU and California from our site. We''ve got enough customers elsewhere.', 'Minimisation');
INSERT INTO cardgame.card VALUES ('7', '', 'Minimisation');
INSERT INTO cardgame.card VALUES ('8', '', 'Minimisation');
INSERT INTO cardgame.card VALUES ('9', '', 'Minimisation');
INSERT INTO cardgame.card VALUES ('10', '', 'Minimisation');
INSERT INTO cardgame.card VALUES ('J', '', 'Minimisation');
INSERT INTO cardgame.card VALUES ('Q', '', 'Minimisation');
INSERT INTO cardgame.card VALUES ('K', '', 'Minimisation');
INSERT INTO cardgame.card VALUES ('A', 'You have found a piece if personal data that we can technolichally do without.', 'Minimisation');


--
-- Data for Name: card_game; Type: TABLE DATA; Schema: cardgame; Owner: postgres
--

INSERT INTO cardgame.card_game VALUES ('EOP Card Game');


--
-- Data for Name: rank_order; Type: TABLE DATA; Schema: cardgame; Owner: postgres
--

INSERT INTO cardgame.rank_order VALUES ('2', 'two', 0);
INSERT INTO cardgame.rank_order VALUES ('3', 'three', 1);
INSERT INTO cardgame.rank_order VALUES ('4', 'four', 2);
INSERT INTO cardgame.rank_order VALUES ('5', 'five', 3);
INSERT INTO cardgame.rank_order VALUES ('6', 'six', 4);
INSERT INTO cardgame.rank_order VALUES ('7', 'seven', 5);
INSERT INTO cardgame.rank_order VALUES ('8', 'eight', 6);
INSERT INTO cardgame.rank_order VALUES ('9', 'nine', 7);
INSERT INTO cardgame.rank_order VALUES ('10', 'ten', 8);
INSERT INTO cardgame.rank_order VALUES ('J', 'Jack', 9);
INSERT INTO cardgame.rank_order VALUES ('Q', 'Queen', 10);
INSERT INTO cardgame.rank_order VALUES ('K', 'King', 11);
INSERT INTO cardgame.rank_order VALUES ('A', 'Ace', 12);


--
-- Data for Name: suit; Type: TABLE DATA; Schema: cardgame; Owner: postgres
--

INSERT INTO cardgame.suit VALUES ('Spoofing', 'EOP Card Game');
INSERT INTO cardgame.suit VALUES ('Tampering', 'EOP Card Game');
INSERT INTO cardgame.suit VALUES ('Repudiation', 'EOP Card Game');
INSERT INTO cardgame.suit VALUES ('Information disclosure', 'EOP Card Game');
INSERT INTO cardgame.suit VALUES ('Denial of service', 'EOP Card Game');
INSERT INTO cardgame.suit VALUES ('Elevation of privilege', 'EOP Card Game');
INSERT INTO cardgame.suit VALUES ('Transport', 'EOP Card Game');
INSERT INTO cardgame.suit VALUES ('Retention', 'EOP Card Game');
INSERT INTO cardgame.suit VALUES ('Inference', 'EOP Card Game');
INSERT INTO cardgame.suit VALUES ('Minimisation', 'EOP Card Game');


--
-- Data for Name: suit_order; Type: TABLE DATA; Schema: cardgame; Owner: postgres
--

INSERT INTO cardgame.suit_order VALUES ('Spoofing', 0);
INSERT INTO cardgame.suit_order VALUES ('Tampering', 1);
INSERT INTO cardgame.suit_order VALUES ('Repudiation', 2);
INSERT INTO cardgame.suit_order VALUES ('Information Disclosure', 3);
INSERT INTO cardgame.suit_order VALUES ('Denial of Service', 4);
INSERT INTO cardgame.suit_order VALUES ('Elevation of Privilege', 5);
INSERT INTO cardgame.suit_order VALUES ('Transport', 6);
INSERT INTO cardgame.suit_order VALUES ('Retention', 7);
INSERT INTO cardgame.suit_order VALUES ('Inference', 8);
INSERT INTO cardgame.suit_order VALUES ('Minimisation', 9);


--
-- Data for Name: asset; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: assetvalue; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: lifecycle; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: part; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: repolink; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: team; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: threat; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: threatactor; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: threatclass; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: threatdefence; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: threatoccurence; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: threatrating; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: threatseverity; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Data for Name: threattype; Type: TABLE DATA; Schema: threatmodel; Owner: postgres
--



--
-- Name: card_game card_game_pkey; Type: CONSTRAINT; Schema: cardgame; Owner: postgres
--

ALTER TABLE ONLY cardgame.card_game
    ADD CONSTRAINT card_game_pkey PRIMARY KEY (name);


--
-- Name: card card_pkey; Type: CONSTRAINT; Schema: cardgame; Owner: postgres
--

ALTER TABLE ONLY cardgame.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (rank, suit);


--
-- Name: rank_order rank_order_pkey; Type: CONSTRAINT; Schema: cardgame; Owner: postgres
--

ALTER TABLE ONLY cardgame.rank_order
    ADD CONSTRAINT rank_order_pkey PRIMARY KEY (rank);


--
-- Name: suit suit_pkey; Type: CONSTRAINT; Schema: cardgame; Owner: postgres
--

ALTER TABLE ONLY cardgame.suit
    ADD CONSTRAINT suit_pkey PRIMARY KEY (name);


--
-- Name: asset asset_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.asset
    ADD CONSTRAINT asset_pkey PRIMARY KEY (id);


--
-- Name: assetvalue assetvalue_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.assetvalue
    ADD CONSTRAINT assetvalue_pkey PRIMARY KEY (id);


--
-- Name: lifecycle lifecycle_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.lifecycle
    ADD CONSTRAINT lifecycle_pkey PRIMARY KEY (id);


--
-- Name: part part_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.part
    ADD CONSTRAINT part_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: threat threat_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.threat
    ADD CONSTRAINT threat_pkey PRIMARY KEY ("ID");


--
-- Name: threatactor threatactor_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.threatactor
    ADD CONSTRAINT threatactor_pkey PRIMARY KEY (id);


--
-- Name: threatclass threatclass_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.threatclass
    ADD CONSTRAINT threatclass_pkey PRIMARY KEY (id);


--
-- Name: threatdefence threatdefence_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.threatdefence
    ADD CONSTRAINT threatdefence_pkey PRIMARY KEY (id);


--
-- Name: threatoccurence threatoccurence_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.threatoccurence
    ADD CONSTRAINT threatoccurence_pkey PRIMARY KEY (id);


--
-- Name: threatrating threatrating_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.threatrating
    ADD CONSTRAINT threatrating_pkey PRIMARY KEY (id);


--
-- Name: threatseverity threatseverity_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.threatseverity
    ADD CONSTRAINT threatseverity_pkey PRIMARY KEY (id);


--
-- Name: threattype threattype_pkey; Type: CONSTRAINT; Schema: threatmodel; Owner: postgres
--

ALTER TABLE ONLY threatmodel.threattype
    ADD CONSTRAINT threattype_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

