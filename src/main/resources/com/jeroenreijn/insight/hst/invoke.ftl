<#ftl strip_whitespace=true>
<#import "/insight-1.0.ftl" as insight />

<@insight.group label="HST component">
    <@insight.entry name="Component class" value=operation.componentClass/>
    <@insight.entry name="Component window" value=operation.windowName />
</@insight.group>
