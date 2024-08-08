package org.gradle.accessors.dm;

import org.gradle.api.NonNullApi;
import org.gradle.api.artifacts.MinimalExternalModuleDependency;
import org.gradle.plugin.use.PluginDependency;
import org.gradle.api.artifacts.ExternalModuleDependencyBundle;
import org.gradle.api.artifacts.MutableVersionConstraint;
import org.gradle.api.provider.Provider;
import org.gradle.api.model.ObjectFactory;
import org.gradle.api.provider.ProviderFactory;
import org.gradle.api.internal.catalog.AbstractExternalDependencyFactory;
import org.gradle.api.internal.catalog.DefaultVersionCatalog;
import java.util.Map;
import org.gradle.api.internal.attributes.ImmutableAttributesFactory;
import org.gradle.api.internal.artifacts.dsl.CapabilityNotationParser;
import javax.inject.Inject;

/**
 * A catalog of dependencies accessible via the `libs` extension.
 */
@NonNullApi
public class LibrariesForLibs extends AbstractExternalDependencyFactory {

    private final AbstractExternalDependencyFactory owner = this;
    private final ComLibraryAccessors laccForComLibraryAccessors = new ComLibraryAccessors(owner);
    private final CommonsLibraryAccessors laccForCommonsLibraryAccessors = new CommonsLibraryAccessors(owner);
    private final JavaxLibraryAccessors laccForJavaxLibraryAccessors = new JavaxLibraryAccessors(owner);
    private final JunitLibraryAccessors laccForJunitLibraryAccessors = new JunitLibraryAccessors(owner);
    private final OrgLibraryAccessors laccForOrgLibraryAccessors = new OrgLibraryAccessors(owner);
    private final VersionAccessors vaccForVersionAccessors = new VersionAccessors(providers, config);
    private final BundleAccessors baccForBundleAccessors = new BundleAccessors(objects, providers, config, attributesFactory, capabilityNotationParser);
    private final PluginAccessors paccForPluginAccessors = new PluginAccessors(providers, config);

    @Inject
    public LibrariesForLibs(DefaultVersionCatalog config, ProviderFactory providers, ObjectFactory objects, ImmutableAttributesFactory attributesFactory, CapabilityNotationParser capabilityNotationParser) {
        super(config, providers, objects, attributesFactory, capabilityNotationParser);
    }

    /**
     * Returns the group of libraries at com
     */
    public ComLibraryAccessors getCom() {
        return laccForComLibraryAccessors;
    }

    /**
     * Returns the group of libraries at commons
     */
    public CommonsLibraryAccessors getCommons() {
        return laccForCommonsLibraryAccessors;
    }

    /**
     * Returns the group of libraries at javax
     */
    public JavaxLibraryAccessors getJavax() {
        return laccForJavaxLibraryAccessors;
    }

    /**
     * Returns the group of libraries at junit
     */
    public JunitLibraryAccessors getJunit() {
        return laccForJunitLibraryAccessors;
    }

    /**
     * Returns the group of libraries at org
     */
    public OrgLibraryAccessors getOrg() {
        return laccForOrgLibraryAccessors;
    }

    /**
     * Returns the group of versions at versions
     */
    public VersionAccessors getVersions() {
        return vaccForVersionAccessors;
    }

    /**
     * Returns the group of bundles at bundles
     */
    public BundleAccessors getBundles() {
        return baccForBundleAccessors;
    }

    /**
     * Returns the group of plugins at plugins
     */
    public PluginAccessors getPlugins() {
        return paccForPluginAccessors;
    }

    public static class ComLibraryAccessors extends SubDependencyFactory {
        private final ComFasterxmlLibraryAccessors laccForComFasterxmlLibraryAccessors = new ComFasterxmlLibraryAccessors(owner);
        private final ComGooglecodeLibraryAccessors laccForComGooglecodeLibraryAccessors = new ComGooglecodeLibraryAccessors(owner);
        private final ComOracleLibraryAccessors laccForComOracleLibraryAccessors = new ComOracleLibraryAccessors(owner);
        private final ComSunLibraryAccessors laccForComSunLibraryAccessors = new ComSunLibraryAccessors(owner);

        public ComLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.fasterxml
         */
        public ComFasterxmlLibraryAccessors getFasterxml() {
            return laccForComFasterxmlLibraryAccessors;
        }

        /**
         * Returns the group of libraries at com.googlecode
         */
        public ComGooglecodeLibraryAccessors getGooglecode() {
            return laccForComGooglecodeLibraryAccessors;
        }

        /**
         * Returns the group of libraries at com.oracle
         */
        public ComOracleLibraryAccessors getOracle() {
            return laccForComOracleLibraryAccessors;
        }

        /**
         * Returns the group of libraries at com.sun
         */
        public ComSunLibraryAccessors getSun() {
            return laccForComSunLibraryAccessors;
        }

    }

    public static class ComFasterxmlLibraryAccessors extends SubDependencyFactory {
        private final ComFasterxmlJacksonLibraryAccessors laccForComFasterxmlJacksonLibraryAccessors = new ComFasterxmlJacksonLibraryAccessors(owner);

        public ComFasterxmlLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.fasterxml.jackson
         */
        public ComFasterxmlJacksonLibraryAccessors getJackson() {
            return laccForComFasterxmlJacksonLibraryAccessors;
        }

    }

    public static class ComFasterxmlJacksonLibraryAccessors extends SubDependencyFactory {
        private final ComFasterxmlJacksonCoreLibraryAccessors laccForComFasterxmlJacksonCoreLibraryAccessors = new ComFasterxmlJacksonCoreLibraryAccessors(owner);

        public ComFasterxmlJacksonLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.fasterxml.jackson.core
         */
        public ComFasterxmlJacksonCoreLibraryAccessors getCore() {
            return laccForComFasterxmlJacksonCoreLibraryAccessors;
        }

    }

    public static class ComFasterxmlJacksonCoreLibraryAccessors extends SubDependencyFactory {
        private final ComFasterxmlJacksonCoreJacksonLibraryAccessors laccForComFasterxmlJacksonCoreJacksonLibraryAccessors = new ComFasterxmlJacksonCoreJacksonLibraryAccessors(owner);

        public ComFasterxmlJacksonCoreLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.fasterxml.jackson.core.jackson
         */
        public ComFasterxmlJacksonCoreJacksonLibraryAccessors getJackson() {
            return laccForComFasterxmlJacksonCoreJacksonLibraryAccessors;
        }

    }

    public static class ComFasterxmlJacksonCoreJacksonLibraryAccessors extends SubDependencyFactory {

        public ComFasterxmlJacksonCoreJacksonLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for annotations (com.fasterxml.jackson.core:jackson-annotations)
         * with versionRef 'com.fasterxml.jackson.core.jackson.annotations'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getAnnotations() {
                return create("com.fasterxml.jackson.core.jackson.annotations");
        }

            /**
             * Creates a dependency provider for core (com.fasterxml.jackson.core:jackson-core)
         * with versionRef 'com.fasterxml.jackson.core.jackson.core'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getCore() {
                return create("com.fasterxml.jackson.core.jackson.core");
        }

            /**
             * Creates a dependency provider for databind (com.fasterxml.jackson.core:jackson-databind)
         * with versionRef 'com.fasterxml.jackson.core.jackson.databind'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getDatabind() {
                return create("com.fasterxml.jackson.core.jackson.databind");
        }

    }

    public static class ComGooglecodeLibraryAccessors extends SubDependencyFactory {
        private final ComGooglecodeJsonLibraryAccessors laccForComGooglecodeJsonLibraryAccessors = new ComGooglecodeJsonLibraryAccessors(owner);

        public ComGooglecodeLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.googlecode.json
         */
        public ComGooglecodeJsonLibraryAccessors getJson() {
            return laccForComGooglecodeJsonLibraryAccessors;
        }

    }

    public static class ComGooglecodeJsonLibraryAccessors extends SubDependencyFactory {
        private final ComGooglecodeJsonSimpleLibraryAccessors laccForComGooglecodeJsonSimpleLibraryAccessors = new ComGooglecodeJsonSimpleLibraryAccessors(owner);

        public ComGooglecodeJsonLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.googlecode.json.simple
         */
        public ComGooglecodeJsonSimpleLibraryAccessors getSimple() {
            return laccForComGooglecodeJsonSimpleLibraryAccessors;
        }

    }

    public static class ComGooglecodeJsonSimpleLibraryAccessors extends SubDependencyFactory {
        private final ComGooglecodeJsonSimpleJsonLibraryAccessors laccForComGooglecodeJsonSimpleJsonLibraryAccessors = new ComGooglecodeJsonSimpleJsonLibraryAccessors(owner);

        public ComGooglecodeJsonSimpleLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.googlecode.json.simple.json
         */
        public ComGooglecodeJsonSimpleJsonLibraryAccessors getJson() {
            return laccForComGooglecodeJsonSimpleJsonLibraryAccessors;
        }

    }

    public static class ComGooglecodeJsonSimpleJsonLibraryAccessors extends SubDependencyFactory {

        public ComGooglecodeJsonSimpleJsonLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for simple (com.googlecode.json-simple:json-simple)
         * with versionRef 'com.googlecode.json.simple.json.simple'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getSimple() {
                return create("com.googlecode.json.simple.json.simple");
        }

    }

    public static class ComOracleLibraryAccessors extends SubDependencyFactory {
        private final ComOracleDatabaseLibraryAccessors laccForComOracleDatabaseLibraryAccessors = new ComOracleDatabaseLibraryAccessors(owner);

        public ComOracleLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.oracle.database
         */
        public ComOracleDatabaseLibraryAccessors getDatabase() {
            return laccForComOracleDatabaseLibraryAccessors;
        }

    }

    public static class ComOracleDatabaseLibraryAccessors extends SubDependencyFactory {
        private final ComOracleDatabaseJdbcLibraryAccessors laccForComOracleDatabaseJdbcLibraryAccessors = new ComOracleDatabaseJdbcLibraryAccessors(owner);
        private final ComOracleDatabaseSecurityLibraryAccessors laccForComOracleDatabaseSecurityLibraryAccessors = new ComOracleDatabaseSecurityLibraryAccessors(owner);

        public ComOracleDatabaseLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.oracle.database.jdbc
         */
        public ComOracleDatabaseJdbcLibraryAccessors getJdbc() {
            return laccForComOracleDatabaseJdbcLibraryAccessors;
        }

        /**
         * Returns the group of libraries at com.oracle.database.security
         */
        public ComOracleDatabaseSecurityLibraryAccessors getSecurity() {
            return laccForComOracleDatabaseSecurityLibraryAccessors;
        }

    }

    public static class ComOracleDatabaseJdbcLibraryAccessors extends SubDependencyFactory {

        public ComOracleDatabaseJdbcLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for ojdbc11 (com.oracle.database.jdbc:ojdbc11)
         * with versionRef 'com.oracle.database.jdbc.ojdbc11'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getOjdbc11() {
                return create("com.oracle.database.jdbc.ojdbc11");
        }

    }

    public static class ComOracleDatabaseSecurityLibraryAccessors extends SubDependencyFactory {

        public ComOracleDatabaseSecurityLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for oraclepki (com.oracle.database.security:oraclepki)
         * with versionRef 'com.oracle.database.security.oraclepki'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getOraclepki() {
                return create("com.oracle.database.security.oraclepki");
        }

    }

    public static class ComSunLibraryAccessors extends SubDependencyFactory {
        private final ComSunMailLibraryAccessors laccForComSunMailLibraryAccessors = new ComSunMailLibraryAccessors(owner);

        public ComSunLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at com.sun.mail
         */
        public ComSunMailLibraryAccessors getMail() {
            return laccForComSunMailLibraryAccessors;
        }

    }

    public static class ComSunMailLibraryAccessors extends SubDependencyFactory {

        public ComSunMailLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for smtp (com.sun.mail:smtp)
         * with versionRef 'com.sun.mail.smtp'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getSmtp() {
                return create("com.sun.mail.smtp");
        }

    }

    public static class CommonsLibraryAccessors extends SubDependencyFactory {
        private final CommonsFileuploadLibraryAccessors laccForCommonsFileuploadLibraryAccessors = new CommonsFileuploadLibraryAccessors(owner);

        public CommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at commons.fileupload
         */
        public CommonsFileuploadLibraryAccessors getFileupload() {
            return laccForCommonsFileuploadLibraryAccessors;
        }

    }

    public static class CommonsFileuploadLibraryAccessors extends SubDependencyFactory {
        private final CommonsFileuploadCommonsLibraryAccessors laccForCommonsFileuploadCommonsLibraryAccessors = new CommonsFileuploadCommonsLibraryAccessors(owner);

        public CommonsFileuploadLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at commons.fileupload.commons
         */
        public CommonsFileuploadCommonsLibraryAccessors getCommons() {
            return laccForCommonsFileuploadCommonsLibraryAccessors;
        }

    }

    public static class CommonsFileuploadCommonsLibraryAccessors extends SubDependencyFactory {

        public CommonsFileuploadCommonsLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for fileupload (commons-fileupload:commons-fileupload)
         * with versionRef 'commons.fileupload.commons.fileupload'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getFileupload() {
                return create("commons.fileupload.commons.fileupload");
        }

    }

    public static class JavaxLibraryAccessors extends SubDependencyFactory {
        private final JavaxInjectLibraryAccessors laccForJavaxInjectLibraryAccessors = new JavaxInjectLibraryAccessors(owner);
        private final JavaxMailLibraryAccessors laccForJavaxMailLibraryAccessors = new JavaxMailLibraryAccessors(owner);
        private final JavaxServletLibraryAccessors laccForJavaxServletLibraryAccessors = new JavaxServletLibraryAccessors(owner);

        public JavaxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at javax.inject
         */
        public JavaxInjectLibraryAccessors getInject() {
            return laccForJavaxInjectLibraryAccessors;
        }

        /**
         * Returns the group of libraries at javax.mail
         */
        public JavaxMailLibraryAccessors getMail() {
            return laccForJavaxMailLibraryAccessors;
        }

        /**
         * Returns the group of libraries at javax.servlet
         */
        public JavaxServletLibraryAccessors getServlet() {
            return laccForJavaxServletLibraryAccessors;
        }

    }

    public static class JavaxInjectLibraryAccessors extends SubDependencyFactory {
        private final JavaxInjectJavaxLibraryAccessors laccForJavaxInjectJavaxLibraryAccessors = new JavaxInjectJavaxLibraryAccessors(owner);

        public JavaxInjectLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at javax.inject.javax
         */
        public JavaxInjectJavaxLibraryAccessors getJavax() {
            return laccForJavaxInjectJavaxLibraryAccessors;
        }

    }

    public static class JavaxInjectJavaxLibraryAccessors extends SubDependencyFactory {

        public JavaxInjectJavaxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for inject (javax.inject:javax.inject)
         * with versionRef 'javax.inject.javax.inject'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getInject() {
                return create("javax.inject.javax.inject");
        }

    }

    public static class JavaxMailLibraryAccessors extends SubDependencyFactory {
        private final JavaxMailJavaxLibraryAccessors laccForJavaxMailJavaxLibraryAccessors = new JavaxMailJavaxLibraryAccessors(owner);

        public JavaxMailLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at javax.mail.javax
         */
        public JavaxMailJavaxLibraryAccessors getJavax() {
            return laccForJavaxMailJavaxLibraryAccessors;
        }

    }

    public static class JavaxMailJavaxLibraryAccessors extends SubDependencyFactory {
        private final JavaxMailJavaxMailLibraryAccessors laccForJavaxMailJavaxMailLibraryAccessors = new JavaxMailJavaxMailLibraryAccessors(owner);

        public JavaxMailJavaxLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at javax.mail.javax.mail
         */
        public JavaxMailJavaxMailLibraryAccessors getMail() {
            return laccForJavaxMailJavaxMailLibraryAccessors;
        }

    }

    public static class JavaxMailJavaxMailLibraryAccessors extends SubDependencyFactory {

        public JavaxMailJavaxMailLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for api (javax.mail:javax.mail-api)
         * with versionRef 'javax.mail.javax.mail.api'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getApi() {
                return create("javax.mail.javax.mail.api");
        }

    }

    public static class JavaxServletLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletJspLibraryAccessors laccForJavaxServletJspLibraryAccessors = new JavaxServletJspLibraryAccessors(owner);
        private final JavaxServletServletLibraryAccessors laccForJavaxServletServletLibraryAccessors = new JavaxServletServletLibraryAccessors(owner);

        public JavaxServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for jstl (javax.servlet:jstl)
         * with versionRef 'javax.servlet.jstl'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getJstl() {
                return create("javax.servlet.jstl");
        }

        /**
         * Returns the group of libraries at javax.servlet.jsp
         */
        public JavaxServletJspLibraryAccessors getJsp() {
            return laccForJavaxServletJspLibraryAccessors;
        }

        /**
         * Returns the group of libraries at javax.servlet.servlet
         */
        public JavaxServletServletLibraryAccessors getServlet() {
            return laccForJavaxServletServletLibraryAccessors;
        }

    }

    public static class JavaxServletJspLibraryAccessors extends SubDependencyFactory {
        private final JavaxServletJspJspLibraryAccessors laccForJavaxServletJspJspLibraryAccessors = new JavaxServletJspJspLibraryAccessors(owner);

        public JavaxServletJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at javax.servlet.jsp.jsp
         */
        public JavaxServletJspJspLibraryAccessors getJsp() {
            return laccForJavaxServletJspJspLibraryAccessors;
        }

    }

    public static class JavaxServletJspJspLibraryAccessors extends SubDependencyFactory {

        public JavaxServletJspJspLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for api (javax.servlet.jsp:jsp-api)
         * with versionRef 'javax.servlet.jsp.jsp.api'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getApi() {
                return create("javax.servlet.jsp.jsp.api");
        }

    }

    public static class JavaxServletServletLibraryAccessors extends SubDependencyFactory {

        public JavaxServletServletLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for api (javax.servlet:servlet-api)
         * with versionRef 'javax.servlet.servlet.api'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getApi() {
                return create("javax.servlet.servlet.api");
        }

    }

    public static class JunitLibraryAccessors extends SubDependencyFactory {

        public JunitLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for junit (junit:junit)
         * with versionRef 'junit.junit'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getJunit() {
                return create("junit.junit");
        }

    }

    public static class OrgLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheLibraryAccessors laccForOrgApacheLibraryAccessors = new OrgApacheLibraryAccessors(owner);
        private final OrgAspectjLibraryAccessors laccForOrgAspectjLibraryAccessors = new OrgAspectjLibraryAccessors(owner);
        private final OrgMybatisLibraryAccessors laccForOrgMybatisLibraryAccessors = new OrgMybatisLibraryAccessors(owner);
        private final OrgProjectlombokLibraryAccessors laccForOrgProjectlombokLibraryAccessors = new OrgProjectlombokLibraryAccessors(owner);
        private final OrgSlf4jLibraryAccessors laccForOrgSlf4jLibraryAccessors = new OrgSlf4jLibraryAccessors(owner);
        private final OrgSpringframeworkLibraryAccessors laccForOrgSpringframeworkLibraryAccessors = new OrgSpringframeworkLibraryAccessors(owner);

        public OrgLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at org.apache
         */
        public OrgApacheLibraryAccessors getApache() {
            return laccForOrgApacheLibraryAccessors;
        }

        /**
         * Returns the group of libraries at org.aspectj
         */
        public OrgAspectjLibraryAccessors getAspectj() {
            return laccForOrgAspectjLibraryAccessors;
        }

        /**
         * Returns the group of libraries at org.mybatis
         */
        public OrgMybatisLibraryAccessors getMybatis() {
            return laccForOrgMybatisLibraryAccessors;
        }

        /**
         * Returns the group of libraries at org.projectlombok
         */
        public OrgProjectlombokLibraryAccessors getProjectlombok() {
            return laccForOrgProjectlombokLibraryAccessors;
        }

        /**
         * Returns the group of libraries at org.slf4j
         */
        public OrgSlf4jLibraryAccessors getSlf4j() {
            return laccForOrgSlf4jLibraryAccessors;
        }

        /**
         * Returns the group of libraries at org.springframework
         */
        public OrgSpringframeworkLibraryAccessors getSpringframework() {
            return laccForOrgSpringframeworkLibraryAccessors;
        }

    }

    public static class OrgApacheLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheLoggingLibraryAccessors laccForOrgApacheLoggingLibraryAccessors = new OrgApacheLoggingLibraryAccessors(owner);

        public OrgApacheLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at org.apache.logging
         */
        public OrgApacheLoggingLibraryAccessors getLogging() {
            return laccForOrgApacheLoggingLibraryAccessors;
        }

    }

    public static class OrgApacheLoggingLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheLoggingLog4jLibraryAccessors laccForOrgApacheLoggingLog4jLibraryAccessors = new OrgApacheLoggingLog4jLibraryAccessors(owner);

        public OrgApacheLoggingLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at org.apache.logging.log4j
         */
        public OrgApacheLoggingLog4jLibraryAccessors getLog4j() {
            return laccForOrgApacheLoggingLog4jLibraryAccessors;
        }

    }

    public static class OrgApacheLoggingLog4jLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheLoggingLog4jLog4jLibraryAccessors laccForOrgApacheLoggingLog4jLog4jLibraryAccessors = new OrgApacheLoggingLog4jLog4jLibraryAccessors(owner);

        public OrgApacheLoggingLog4jLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at org.apache.logging.log4j.log4j
         */
        public OrgApacheLoggingLog4jLog4jLibraryAccessors getLog4j() {
            return laccForOrgApacheLoggingLog4jLog4jLibraryAccessors;
        }

    }

    public static class OrgApacheLoggingLog4jLog4jLibraryAccessors extends SubDependencyFactory {
        private final OrgApacheLoggingLog4jLog4jSlf4jLibraryAccessors laccForOrgApacheLoggingLog4jLog4jSlf4jLibraryAccessors = new OrgApacheLoggingLog4jLog4jSlf4jLibraryAccessors(owner);

        public OrgApacheLoggingLog4jLog4jLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for api (org.apache.logging.log4j:log4j-api)
         * with versionRef 'org.apache.logging.log4j.log4j.api'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getApi() {
                return create("org.apache.logging.log4j.log4j.api");
        }

            /**
             * Creates a dependency provider for core (org.apache.logging.log4j:log4j-core)
         * with versionRef 'org.apache.logging.log4j.log4j.core'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getCore() {
                return create("org.apache.logging.log4j.log4j.core");
        }

        /**
         * Returns the group of libraries at org.apache.logging.log4j.log4j.slf4j
         */
        public OrgApacheLoggingLog4jLog4jSlf4jLibraryAccessors getSlf4j() {
            return laccForOrgApacheLoggingLog4jLog4jSlf4jLibraryAccessors;
        }

    }

    public static class OrgApacheLoggingLog4jLog4jSlf4jLibraryAccessors extends SubDependencyFactory {

        public OrgApacheLoggingLog4jLog4jSlf4jLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for impl (org.apache.logging.log4j:log4j-slf4j-impl)
         * with versionRef 'org.apache.logging.log4j.log4j.slf4j.impl'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getImpl() {
                return create("org.apache.logging.log4j.log4j.slf4j.impl");
        }

    }

    public static class OrgAspectjLibraryAccessors extends SubDependencyFactory {

        public OrgAspectjLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for aspectjrt (org.aspectj:aspectjrt)
         * with versionRef 'org.aspectj.aspectjrt'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getAspectjrt() {
                return create("org.aspectj.aspectjrt");
        }

    }

    public static class OrgMybatisLibraryAccessors extends SubDependencyFactory {

        public OrgMybatisLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for mybatis (org.mybatis:mybatis)
         * with versionRef 'org.mybatis.mybatis'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getMybatis() {
                return create("org.mybatis.mybatis");
        }

    }

    public static class OrgProjectlombokLibraryAccessors extends SubDependencyFactory {

        public OrgProjectlombokLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for lombok (org.projectlombok:lombok)
         * with versionRef 'org.projectlombok.lombok'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getLombok() {
                return create("org.projectlombok.lombok");
        }

    }

    public static class OrgSlf4jLibraryAccessors extends SubDependencyFactory {
        private final OrgSlf4jJclLibraryAccessors laccForOrgSlf4jJclLibraryAccessors = new OrgSlf4jJclLibraryAccessors(owner);
        private final OrgSlf4jSlf4jLibraryAccessors laccForOrgSlf4jSlf4jLibraryAccessors = new OrgSlf4jSlf4jLibraryAccessors(owner);

        public OrgSlf4jLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at org.slf4j.jcl
         */
        public OrgSlf4jJclLibraryAccessors getJcl() {
            return laccForOrgSlf4jJclLibraryAccessors;
        }

        /**
         * Returns the group of libraries at org.slf4j.slf4j
         */
        public OrgSlf4jSlf4jLibraryAccessors getSlf4j() {
            return laccForOrgSlf4jSlf4jLibraryAccessors;
        }

    }

    public static class OrgSlf4jJclLibraryAccessors extends SubDependencyFactory {
        private final OrgSlf4jJclOverLibraryAccessors laccForOrgSlf4jJclOverLibraryAccessors = new OrgSlf4jJclOverLibraryAccessors(owner);

        public OrgSlf4jJclLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at org.slf4j.jcl.over
         */
        public OrgSlf4jJclOverLibraryAccessors getOver() {
            return laccForOrgSlf4jJclOverLibraryAccessors;
        }

    }

    public static class OrgSlf4jJclOverLibraryAccessors extends SubDependencyFactory {

        public OrgSlf4jJclOverLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for slf4j (org.slf4j:jcl-over-slf4j)
         * with versionRef 'org.slf4j.jcl.over.slf4j'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getSlf4j() {
                return create("org.slf4j.jcl.over.slf4j");
        }

    }

    public static class OrgSlf4jSlf4jLibraryAccessors extends SubDependencyFactory {

        public OrgSlf4jSlf4jLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for api (org.slf4j:slf4j-api)
         * with versionRef 'org.slf4j.slf4j.api'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getApi() {
                return create("org.slf4j.slf4j.api");
        }

    }

    public static class OrgSpringframeworkLibraryAccessors extends SubDependencyFactory {
        private final OrgSpringframeworkSecurityLibraryAccessors laccForOrgSpringframeworkSecurityLibraryAccessors = new OrgSpringframeworkSecurityLibraryAccessors(owner);
        private final OrgSpringframeworkSpringLibraryAccessors laccForOrgSpringframeworkSpringLibraryAccessors = new OrgSpringframeworkSpringLibraryAccessors(owner);

        public OrgSpringframeworkLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at org.springframework.security
         */
        public OrgSpringframeworkSecurityLibraryAccessors getSecurity() {
            return laccForOrgSpringframeworkSecurityLibraryAccessors;
        }

        /**
         * Returns the group of libraries at org.springframework.spring
         */
        public OrgSpringframeworkSpringLibraryAccessors getSpring() {
            return laccForOrgSpringframeworkSpringLibraryAccessors;
        }

    }

    public static class OrgSpringframeworkSecurityLibraryAccessors extends SubDependencyFactory {
        private final OrgSpringframeworkSecuritySpringLibraryAccessors laccForOrgSpringframeworkSecuritySpringLibraryAccessors = new OrgSpringframeworkSecuritySpringLibraryAccessors(owner);

        public OrgSpringframeworkSecurityLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at org.springframework.security.spring
         */
        public OrgSpringframeworkSecuritySpringLibraryAccessors getSpring() {
            return laccForOrgSpringframeworkSecuritySpringLibraryAccessors;
        }

    }

    public static class OrgSpringframeworkSecuritySpringLibraryAccessors extends SubDependencyFactory {
        private final OrgSpringframeworkSecuritySpringSecurityLibraryAccessors laccForOrgSpringframeworkSecuritySpringSecurityLibraryAccessors = new OrgSpringframeworkSecuritySpringSecurityLibraryAccessors(owner);

        public OrgSpringframeworkSecuritySpringLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

        /**
         * Returns the group of libraries at org.springframework.security.spring.security
         */
        public OrgSpringframeworkSecuritySpringSecurityLibraryAccessors getSecurity() {
            return laccForOrgSpringframeworkSecuritySpringSecurityLibraryAccessors;
        }

    }

    public static class OrgSpringframeworkSecuritySpringSecurityLibraryAccessors extends SubDependencyFactory {

        public OrgSpringframeworkSecuritySpringSecurityLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for config (org.springframework.security:spring-security-config)
         * with versionRef 'org.springframework.security.spring.security.config'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getConfig() {
                return create("org.springframework.security.spring.security.config");
        }

            /**
             * Creates a dependency provider for core (org.springframework.security:spring-security-core)
         * with versionRef 'org.springframework.security.spring.security.core'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getCore() {
                return create("org.springframework.security.spring.security.core");
        }

            /**
             * Creates a dependency provider for taglibs (org.springframework.security:spring-security-taglibs)
         * with versionRef 'org.springframework.security.spring.security.taglibs'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getTaglibs() {
                return create("org.springframework.security.spring.security.taglibs");
        }

            /**
             * Creates a dependency provider for web (org.springframework.security:spring-security-web)
         * with versionRef 'org.springframework.security.spring.security.web'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getWeb() {
                return create("org.springframework.security.spring.security.web");
        }

    }

    public static class OrgSpringframeworkSpringLibraryAccessors extends SubDependencyFactory {

        public OrgSpringframeworkSpringLibraryAccessors(AbstractExternalDependencyFactory owner) { super(owner); }

            /**
             * Creates a dependency provider for context (org.springframework:spring-context)
         * with versionRef 'org.springframework.spring.context'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getContext() {
                return create("org.springframework.spring.context");
        }

            /**
             * Creates a dependency provider for jdbc (org.springframework:spring-jdbc)
         * with versionRef 'org.springframework.spring.jdbc'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getJdbc() {
                return create("org.springframework.spring.jdbc");
        }

            /**
             * Creates a dependency provider for webmvc (org.springframework:spring-webmvc)
         * with versionRef 'org.springframework.spring.webmvc'.
             * This dependency was declared in catalog libs.versions.toml
             */
            public Provider<MinimalExternalModuleDependency> getWebmvc() {
                return create("org.springframework.spring.webmvc");
        }

    }

    public static class VersionAccessors extends VersionFactory  {

        private final ComVersionAccessors vaccForComVersionAccessors = new ComVersionAccessors(providers, config);
        private final CommonsVersionAccessors vaccForCommonsVersionAccessors = new CommonsVersionAccessors(providers, config);
        private final JavaxVersionAccessors vaccForJavaxVersionAccessors = new JavaxVersionAccessors(providers, config);
        private final JunitVersionAccessors vaccForJunitVersionAccessors = new JunitVersionAccessors(providers, config);
        private final OrgVersionAccessors vaccForOrgVersionAccessors = new OrgVersionAccessors(providers, config);
        public VersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com
         */
        public ComVersionAccessors getCom() {
            return vaccForComVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.commons
         */
        public CommonsVersionAccessors getCommons() {
            return vaccForCommonsVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.javax
         */
        public JavaxVersionAccessors getJavax() {
            return vaccForJavaxVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.junit
         */
        public JunitVersionAccessors getJunit() {
            return vaccForJunitVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.org
         */
        public OrgVersionAccessors getOrg() {
            return vaccForOrgVersionAccessors;
        }

    }

    public static class ComVersionAccessors extends VersionFactory  {

        private final ComFasterxmlVersionAccessors vaccForComFasterxmlVersionAccessors = new ComFasterxmlVersionAccessors(providers, config);
        private final ComGooglecodeVersionAccessors vaccForComGooglecodeVersionAccessors = new ComGooglecodeVersionAccessors(providers, config);
        private final ComOracleVersionAccessors vaccForComOracleVersionAccessors = new ComOracleVersionAccessors(providers, config);
        private final ComSunVersionAccessors vaccForComSunVersionAccessors = new ComSunVersionAccessors(providers, config);
        public ComVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.fasterxml
         */
        public ComFasterxmlVersionAccessors getFasterxml() {
            return vaccForComFasterxmlVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.com.googlecode
         */
        public ComGooglecodeVersionAccessors getGooglecode() {
            return vaccForComGooglecodeVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.com.oracle
         */
        public ComOracleVersionAccessors getOracle() {
            return vaccForComOracleVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.com.sun
         */
        public ComSunVersionAccessors getSun() {
            return vaccForComSunVersionAccessors;
        }

    }

    public static class ComFasterxmlVersionAccessors extends VersionFactory  {

        private final ComFasterxmlJacksonVersionAccessors vaccForComFasterxmlJacksonVersionAccessors = new ComFasterxmlJacksonVersionAccessors(providers, config);
        public ComFasterxmlVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.fasterxml.jackson
         */
        public ComFasterxmlJacksonVersionAccessors getJackson() {
            return vaccForComFasterxmlJacksonVersionAccessors;
        }

    }

    public static class ComFasterxmlJacksonVersionAccessors extends VersionFactory  {

        private final ComFasterxmlJacksonCoreVersionAccessors vaccForComFasterxmlJacksonCoreVersionAccessors = new ComFasterxmlJacksonCoreVersionAccessors(providers, config);
        public ComFasterxmlJacksonVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.fasterxml.jackson.core
         */
        public ComFasterxmlJacksonCoreVersionAccessors getCore() {
            return vaccForComFasterxmlJacksonCoreVersionAccessors;
        }

    }

    public static class ComFasterxmlJacksonCoreVersionAccessors extends VersionFactory  {

        private final ComFasterxmlJacksonCoreJacksonVersionAccessors vaccForComFasterxmlJacksonCoreJacksonVersionAccessors = new ComFasterxmlJacksonCoreJacksonVersionAccessors(providers, config);
        public ComFasterxmlJacksonCoreVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.fasterxml.jackson.core.jackson
         */
        public ComFasterxmlJacksonCoreJacksonVersionAccessors getJackson() {
            return vaccForComFasterxmlJacksonCoreJacksonVersionAccessors;
        }

    }

    public static class ComFasterxmlJacksonCoreJacksonVersionAccessors extends VersionFactory  {

        public ComFasterxmlJacksonCoreJacksonVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: com.fasterxml.jackson.core.jackson.annotations (2.12.3)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getAnnotations() { return getVersion("com.fasterxml.jackson.core.jackson.annotations"); }

            /**
             * Returns the version associated to this alias: com.fasterxml.jackson.core.jackson.core (2.12.3)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getCore() { return getVersion("com.fasterxml.jackson.core.jackson.core"); }

            /**
             * Returns the version associated to this alias: com.fasterxml.jackson.core.jackson.databind (2.12.3)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getDatabind() { return getVersion("com.fasterxml.jackson.core.jackson.databind"); }

    }

    public static class ComGooglecodeVersionAccessors extends VersionFactory  {

        private final ComGooglecodeJsonVersionAccessors vaccForComGooglecodeJsonVersionAccessors = new ComGooglecodeJsonVersionAccessors(providers, config);
        public ComGooglecodeVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.googlecode.json
         */
        public ComGooglecodeJsonVersionAccessors getJson() {
            return vaccForComGooglecodeJsonVersionAccessors;
        }

    }

    public static class ComGooglecodeJsonVersionAccessors extends VersionFactory  {

        private final ComGooglecodeJsonSimpleVersionAccessors vaccForComGooglecodeJsonSimpleVersionAccessors = new ComGooglecodeJsonSimpleVersionAccessors(providers, config);
        public ComGooglecodeJsonVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.googlecode.json.simple
         */
        public ComGooglecodeJsonSimpleVersionAccessors getSimple() {
            return vaccForComGooglecodeJsonSimpleVersionAccessors;
        }

    }

    public static class ComGooglecodeJsonSimpleVersionAccessors extends VersionFactory  {

        private final ComGooglecodeJsonSimpleJsonVersionAccessors vaccForComGooglecodeJsonSimpleJsonVersionAccessors = new ComGooglecodeJsonSimpleJsonVersionAccessors(providers, config);
        public ComGooglecodeJsonSimpleVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.googlecode.json.simple.json
         */
        public ComGooglecodeJsonSimpleJsonVersionAccessors getJson() {
            return vaccForComGooglecodeJsonSimpleJsonVersionAccessors;
        }

    }

    public static class ComGooglecodeJsonSimpleJsonVersionAccessors extends VersionFactory  {

        public ComGooglecodeJsonSimpleJsonVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: com.googlecode.json.simple.json.simple (1.1.1)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getSimple() { return getVersion("com.googlecode.json.simple.json.simple"); }

    }

    public static class ComOracleVersionAccessors extends VersionFactory  {

        private final ComOracleDatabaseVersionAccessors vaccForComOracleDatabaseVersionAccessors = new ComOracleDatabaseVersionAccessors(providers, config);
        public ComOracleVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.oracle.database
         */
        public ComOracleDatabaseVersionAccessors getDatabase() {
            return vaccForComOracleDatabaseVersionAccessors;
        }

    }

    public static class ComOracleDatabaseVersionAccessors extends VersionFactory  {

        private final ComOracleDatabaseJdbcVersionAccessors vaccForComOracleDatabaseJdbcVersionAccessors = new ComOracleDatabaseJdbcVersionAccessors(providers, config);
        private final ComOracleDatabaseSecurityVersionAccessors vaccForComOracleDatabaseSecurityVersionAccessors = new ComOracleDatabaseSecurityVersionAccessors(providers, config);
        public ComOracleDatabaseVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.oracle.database.jdbc
         */
        public ComOracleDatabaseJdbcVersionAccessors getJdbc() {
            return vaccForComOracleDatabaseJdbcVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.com.oracle.database.security
         */
        public ComOracleDatabaseSecurityVersionAccessors getSecurity() {
            return vaccForComOracleDatabaseSecurityVersionAccessors;
        }

    }

    public static class ComOracleDatabaseJdbcVersionAccessors extends VersionFactory  {

        public ComOracleDatabaseJdbcVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: com.oracle.database.jdbc.ojdbc11 (23.4.0.24.05)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getOjdbc11() { return getVersion("com.oracle.database.jdbc.ojdbc11"); }

    }

    public static class ComOracleDatabaseSecurityVersionAccessors extends VersionFactory  {

        public ComOracleDatabaseSecurityVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: com.oracle.database.security.oraclepki (23.4.0.24.05)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getOraclepki() { return getVersion("com.oracle.database.security.oraclepki"); }

    }

    public static class ComSunVersionAccessors extends VersionFactory  {

        private final ComSunMailVersionAccessors vaccForComSunMailVersionAccessors = new ComSunMailVersionAccessors(providers, config);
        public ComSunVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.com.sun.mail
         */
        public ComSunMailVersionAccessors getMail() {
            return vaccForComSunMailVersionAccessors;
        }

    }

    public static class ComSunMailVersionAccessors extends VersionFactory  {

        public ComSunMailVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: com.sun.mail.smtp (1.6.2)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getSmtp() { return getVersion("com.sun.mail.smtp"); }

    }

    public static class CommonsVersionAccessors extends VersionFactory  {

        private final CommonsFileuploadVersionAccessors vaccForCommonsFileuploadVersionAccessors = new CommonsFileuploadVersionAccessors(providers, config);
        public CommonsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.commons.fileupload
         */
        public CommonsFileuploadVersionAccessors getFileupload() {
            return vaccForCommonsFileuploadVersionAccessors;
        }

    }

    public static class CommonsFileuploadVersionAccessors extends VersionFactory  {

        private final CommonsFileuploadCommonsVersionAccessors vaccForCommonsFileuploadCommonsVersionAccessors = new CommonsFileuploadCommonsVersionAccessors(providers, config);
        public CommonsFileuploadVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.commons.fileupload.commons
         */
        public CommonsFileuploadCommonsVersionAccessors getCommons() {
            return vaccForCommonsFileuploadCommonsVersionAccessors;
        }

    }

    public static class CommonsFileuploadCommonsVersionAccessors extends VersionFactory  {

        public CommonsFileuploadCommonsVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: commons.fileupload.commons.fileupload (1.4)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getFileupload() { return getVersion("commons.fileupload.commons.fileupload"); }

    }

    public static class JavaxVersionAccessors extends VersionFactory  {

        private final JavaxInjectVersionAccessors vaccForJavaxInjectVersionAccessors = new JavaxInjectVersionAccessors(providers, config);
        private final JavaxMailVersionAccessors vaccForJavaxMailVersionAccessors = new JavaxMailVersionAccessors(providers, config);
        private final JavaxServletVersionAccessors vaccForJavaxServletVersionAccessors = new JavaxServletVersionAccessors(providers, config);
        public JavaxVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.javax.inject
         */
        public JavaxInjectVersionAccessors getInject() {
            return vaccForJavaxInjectVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.javax.mail
         */
        public JavaxMailVersionAccessors getMail() {
            return vaccForJavaxMailVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.javax.servlet
         */
        public JavaxServletVersionAccessors getServlet() {
            return vaccForJavaxServletVersionAccessors;
        }

    }

    public static class JavaxInjectVersionAccessors extends VersionFactory  {

        private final JavaxInjectJavaxVersionAccessors vaccForJavaxInjectJavaxVersionAccessors = new JavaxInjectJavaxVersionAccessors(providers, config);
        public JavaxInjectVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.javax.inject.javax
         */
        public JavaxInjectJavaxVersionAccessors getJavax() {
            return vaccForJavaxInjectJavaxVersionAccessors;
        }

    }

    public static class JavaxInjectJavaxVersionAccessors extends VersionFactory  {

        public JavaxInjectJavaxVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: javax.inject.javax.inject (1)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getInject() { return getVersion("javax.inject.javax.inject"); }

    }

    public static class JavaxMailVersionAccessors extends VersionFactory  {

        private final JavaxMailJavaxVersionAccessors vaccForJavaxMailJavaxVersionAccessors = new JavaxMailJavaxVersionAccessors(providers, config);
        public JavaxMailVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.javax.mail.javax
         */
        public JavaxMailJavaxVersionAccessors getJavax() {
            return vaccForJavaxMailJavaxVersionAccessors;
        }

    }

    public static class JavaxMailJavaxVersionAccessors extends VersionFactory  {

        private final JavaxMailJavaxMailVersionAccessors vaccForJavaxMailJavaxMailVersionAccessors = new JavaxMailJavaxMailVersionAccessors(providers, config);
        public JavaxMailJavaxVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.javax.mail.javax.mail
         */
        public JavaxMailJavaxMailVersionAccessors getMail() {
            return vaccForJavaxMailJavaxMailVersionAccessors;
        }

    }

    public static class JavaxMailJavaxMailVersionAccessors extends VersionFactory  {

        public JavaxMailJavaxMailVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: javax.mail.javax.mail.api (1.6.2)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getApi() { return getVersion("javax.mail.javax.mail.api"); }

    }

    public static class JavaxServletVersionAccessors extends VersionFactory  {

        private final JavaxServletJspVersionAccessors vaccForJavaxServletJspVersionAccessors = new JavaxServletJspVersionAccessors(providers, config);
        private final JavaxServletServletVersionAccessors vaccForJavaxServletServletVersionAccessors = new JavaxServletServletVersionAccessors(providers, config);
        public JavaxServletVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: javax.servlet.jstl (1.2)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getJstl() { return getVersion("javax.servlet.jstl"); }

        /**
         * Returns the group of versions at versions.javax.servlet.jsp
         */
        public JavaxServletJspVersionAccessors getJsp() {
            return vaccForJavaxServletJspVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.javax.servlet.servlet
         */
        public JavaxServletServletVersionAccessors getServlet() {
            return vaccForJavaxServletServletVersionAccessors;
        }

    }

    public static class JavaxServletJspVersionAccessors extends VersionFactory  {

        private final JavaxServletJspJspVersionAccessors vaccForJavaxServletJspJspVersionAccessors = new JavaxServletJspJspVersionAccessors(providers, config);
        public JavaxServletJspVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.javax.servlet.jsp.jsp
         */
        public JavaxServletJspJspVersionAccessors getJsp() {
            return vaccForJavaxServletJspJspVersionAccessors;
        }

    }

    public static class JavaxServletJspJspVersionAccessors extends VersionFactory  {

        public JavaxServletJspJspVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: javax.servlet.jsp.jsp.api (2.1)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getApi() { return getVersion("javax.servlet.jsp.jsp.api"); }

    }

    public static class JavaxServletServletVersionAccessors extends VersionFactory  {

        public JavaxServletServletVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: javax.servlet.servlet.api (2.5)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getApi() { return getVersion("javax.servlet.servlet.api"); }

    }

    public static class JunitVersionAccessors extends VersionFactory  {

        public JunitVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: junit.junit (4.13.2)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getJunit() { return getVersion("junit.junit"); }

    }

    public static class OrgVersionAccessors extends VersionFactory  {

        private final OrgApacheVersionAccessors vaccForOrgApacheVersionAccessors = new OrgApacheVersionAccessors(providers, config);
        private final OrgAspectjVersionAccessors vaccForOrgAspectjVersionAccessors = new OrgAspectjVersionAccessors(providers, config);
        private final OrgMybatisVersionAccessors vaccForOrgMybatisVersionAccessors = new OrgMybatisVersionAccessors(providers, config);
        private final OrgProjectlombokVersionAccessors vaccForOrgProjectlombokVersionAccessors = new OrgProjectlombokVersionAccessors(providers, config);
        private final OrgSlf4jVersionAccessors vaccForOrgSlf4jVersionAccessors = new OrgSlf4jVersionAccessors(providers, config);
        private final OrgSpringframeworkVersionAccessors vaccForOrgSpringframeworkVersionAccessors = new OrgSpringframeworkVersionAccessors(providers, config);
        public OrgVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.org.apache
         */
        public OrgApacheVersionAccessors getApache() {
            return vaccForOrgApacheVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.org.aspectj
         */
        public OrgAspectjVersionAccessors getAspectj() {
            return vaccForOrgAspectjVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.org.mybatis
         */
        public OrgMybatisVersionAccessors getMybatis() {
            return vaccForOrgMybatisVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.org.projectlombok
         */
        public OrgProjectlombokVersionAccessors getProjectlombok() {
            return vaccForOrgProjectlombokVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.org.slf4j
         */
        public OrgSlf4jVersionAccessors getSlf4j() {
            return vaccForOrgSlf4jVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.org.springframework
         */
        public OrgSpringframeworkVersionAccessors getSpringframework() {
            return vaccForOrgSpringframeworkVersionAccessors;
        }

    }

    public static class OrgApacheVersionAccessors extends VersionFactory  {

        private final OrgApacheLoggingVersionAccessors vaccForOrgApacheLoggingVersionAccessors = new OrgApacheLoggingVersionAccessors(providers, config);
        public OrgApacheVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.org.apache.logging
         */
        public OrgApacheLoggingVersionAccessors getLogging() {
            return vaccForOrgApacheLoggingVersionAccessors;
        }

    }

    public static class OrgApacheLoggingVersionAccessors extends VersionFactory  {

        private final OrgApacheLoggingLog4jVersionAccessors vaccForOrgApacheLoggingLog4jVersionAccessors = new OrgApacheLoggingLog4jVersionAccessors(providers, config);
        public OrgApacheLoggingVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.org.apache.logging.log4j
         */
        public OrgApacheLoggingLog4jVersionAccessors getLog4j() {
            return vaccForOrgApacheLoggingLog4jVersionAccessors;
        }

    }

    public static class OrgApacheLoggingLog4jVersionAccessors extends VersionFactory  {

        private final OrgApacheLoggingLog4jLog4jVersionAccessors vaccForOrgApacheLoggingLog4jLog4jVersionAccessors = new OrgApacheLoggingLog4jLog4jVersionAccessors(providers, config);
        public OrgApacheLoggingLog4jVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.org.apache.logging.log4j.log4j
         */
        public OrgApacheLoggingLog4jLog4jVersionAccessors getLog4j() {
            return vaccForOrgApacheLoggingLog4jLog4jVersionAccessors;
        }

    }

    public static class OrgApacheLoggingLog4jLog4jVersionAccessors extends VersionFactory  {

        private final OrgApacheLoggingLog4jLog4jSlf4jVersionAccessors vaccForOrgApacheLoggingLog4jLog4jSlf4jVersionAccessors = new OrgApacheLoggingLog4jLog4jSlf4jVersionAccessors(providers, config);
        public OrgApacheLoggingLog4jLog4jVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: org.apache.logging.log4j.log4j.api (2.17.1)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getApi() { return getVersion("org.apache.logging.log4j.log4j.api"); }

            /**
             * Returns the version associated to this alias: org.apache.logging.log4j.log4j.core (2.17.1)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getCore() { return getVersion("org.apache.logging.log4j.log4j.core"); }

        /**
         * Returns the group of versions at versions.org.apache.logging.log4j.log4j.slf4j
         */
        public OrgApacheLoggingLog4jLog4jSlf4jVersionAccessors getSlf4j() {
            return vaccForOrgApacheLoggingLog4jLog4jSlf4jVersionAccessors;
        }

    }

    public static class OrgApacheLoggingLog4jLog4jSlf4jVersionAccessors extends VersionFactory  {

        public OrgApacheLoggingLog4jLog4jSlf4jVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: org.apache.logging.log4j.log4j.slf4j.impl (2.17.1)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getImpl() { return getVersion("org.apache.logging.log4j.log4j.slf4j.impl"); }

    }

    public static class OrgAspectjVersionAccessors extends VersionFactory  {

        public OrgAspectjVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: org.aspectj.aspectjrt (1.9.7)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getAspectjrt() { return getVersion("org.aspectj.aspectjrt"); }

    }

    public static class OrgMybatisVersionAccessors extends VersionFactory  {

        public OrgMybatisVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: org.mybatis.mybatis (3.5.6)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getMybatis() { return getVersion("org.mybatis.mybatis"); }

    }

    public static class OrgProjectlombokVersionAccessors extends VersionFactory  {

        public OrgProjectlombokVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: org.projectlombok.lombok (1.18.24)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getLombok() { return getVersion("org.projectlombok.lombok"); }

    }

    public static class OrgSlf4jVersionAccessors extends VersionFactory  {

        private final OrgSlf4jJclVersionAccessors vaccForOrgSlf4jJclVersionAccessors = new OrgSlf4jJclVersionAccessors(providers, config);
        private final OrgSlf4jSlf4jVersionAccessors vaccForOrgSlf4jSlf4jVersionAccessors = new OrgSlf4jSlf4jVersionAccessors(providers, config);
        public OrgSlf4jVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.org.slf4j.jcl
         */
        public OrgSlf4jJclVersionAccessors getJcl() {
            return vaccForOrgSlf4jJclVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.org.slf4j.slf4j
         */
        public OrgSlf4jSlf4jVersionAccessors getSlf4j() {
            return vaccForOrgSlf4jSlf4jVersionAccessors;
        }

    }

    public static class OrgSlf4jJclVersionAccessors extends VersionFactory  {

        private final OrgSlf4jJclOverVersionAccessors vaccForOrgSlf4jJclOverVersionAccessors = new OrgSlf4jJclOverVersionAccessors(providers, config);
        public OrgSlf4jJclVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.org.slf4j.jcl.over
         */
        public OrgSlf4jJclOverVersionAccessors getOver() {
            return vaccForOrgSlf4jJclOverVersionAccessors;
        }

    }

    public static class OrgSlf4jJclOverVersionAccessors extends VersionFactory  {

        public OrgSlf4jJclOverVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: org.slf4j.jcl.over.slf4j (1.7.32)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getSlf4j() { return getVersion("org.slf4j.jcl.over.slf4j"); }

    }

    public static class OrgSlf4jSlf4jVersionAccessors extends VersionFactory  {

        public OrgSlf4jSlf4jVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: org.slf4j.slf4j.api (1.7.32)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getApi() { return getVersion("org.slf4j.slf4j.api"); }

    }

    public static class OrgSpringframeworkVersionAccessors extends VersionFactory  {

        private final OrgSpringframeworkSecurityVersionAccessors vaccForOrgSpringframeworkSecurityVersionAccessors = new OrgSpringframeworkSecurityVersionAccessors(providers, config);
        private final OrgSpringframeworkSpringVersionAccessors vaccForOrgSpringframeworkSpringVersionAccessors = new OrgSpringframeworkSpringVersionAccessors(providers, config);
        public OrgSpringframeworkVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.org.springframework.security
         */
        public OrgSpringframeworkSecurityVersionAccessors getSecurity() {
            return vaccForOrgSpringframeworkSecurityVersionAccessors;
        }

        /**
         * Returns the group of versions at versions.org.springframework.spring
         */
        public OrgSpringframeworkSpringVersionAccessors getSpring() {
            return vaccForOrgSpringframeworkSpringVersionAccessors;
        }

    }

    public static class OrgSpringframeworkSecurityVersionAccessors extends VersionFactory  {

        private final OrgSpringframeworkSecuritySpringVersionAccessors vaccForOrgSpringframeworkSecuritySpringVersionAccessors = new OrgSpringframeworkSecuritySpringVersionAccessors(providers, config);
        public OrgSpringframeworkSecurityVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.org.springframework.security.spring
         */
        public OrgSpringframeworkSecuritySpringVersionAccessors getSpring() {
            return vaccForOrgSpringframeworkSecuritySpringVersionAccessors;
        }

    }

    public static class OrgSpringframeworkSecuritySpringVersionAccessors extends VersionFactory  {

        private final OrgSpringframeworkSecuritySpringSecurityVersionAccessors vaccForOrgSpringframeworkSecuritySpringSecurityVersionAccessors = new OrgSpringframeworkSecuritySpringSecurityVersionAccessors(providers, config);
        public OrgSpringframeworkSecuritySpringVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

        /**
         * Returns the group of versions at versions.org.springframework.security.spring.security
         */
        public OrgSpringframeworkSecuritySpringSecurityVersionAccessors getSecurity() {
            return vaccForOrgSpringframeworkSecuritySpringSecurityVersionAccessors;
        }

    }

    public static class OrgSpringframeworkSecuritySpringSecurityVersionAccessors extends VersionFactory  {

        public OrgSpringframeworkSecuritySpringSecurityVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: org.springframework.security.spring.security.config (5.5.3)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getConfig() { return getVersion("org.springframework.security.spring.security.config"); }

            /**
             * Returns the version associated to this alias: org.springframework.security.spring.security.core (5.5.3)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getCore() { return getVersion("org.springframework.security.spring.security.core"); }

            /**
             * Returns the version associated to this alias: org.springframework.security.spring.security.taglibs (5.5.3)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getTaglibs() { return getVersion("org.springframework.security.spring.security.taglibs"); }

            /**
             * Returns the version associated to this alias: org.springframework.security.spring.security.web (5.5.3)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getWeb() { return getVersion("org.springframework.security.spring.security.web"); }

    }

    public static class OrgSpringframeworkSpringVersionAccessors extends VersionFactory  {

        public OrgSpringframeworkSpringVersionAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

            /**
             * Returns the version associated to this alias: org.springframework.spring.context (5.3.23)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getContext() { return getVersion("org.springframework.spring.context"); }

            /**
             * Returns the version associated to this alias: org.springframework.spring.jdbc (5.3.23)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getJdbc() { return getVersion("org.springframework.spring.jdbc"); }

            /**
             * Returns the version associated to this alias: org.springframework.spring.webmvc (5.3.23)
             * If the version is a rich version and that its not expressible as a
             * single version string, then an empty string is returned.
             * This version was declared in catalog libs.versions.toml
             */
            public Provider<String> getWebmvc() { return getVersion("org.springframework.spring.webmvc"); }

    }

    public static class BundleAccessors extends BundleFactory {

        public BundleAccessors(ObjectFactory objects, ProviderFactory providers, DefaultVersionCatalog config, ImmutableAttributesFactory attributesFactory, CapabilityNotationParser capabilityNotationParser) { super(objects, providers, config, attributesFactory, capabilityNotationParser); }

    }

    public static class PluginAccessors extends PluginFactory {

        public PluginAccessors(ProviderFactory providers, DefaultVersionCatalog config) { super(providers, config); }

    }

}
