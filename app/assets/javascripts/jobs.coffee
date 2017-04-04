$ ->
 initialize_jobs_typeahead = ->
   jobs_typeahead = new Bloodhound(
     datumTokenizer: Bloodhound.tokenizers.obj.whitespace(
       "title", "location"
     ),
     queryTokenizer: Bloodhound.tokenizers.whitespace,
     prefetch: "/autocomplete"
   )

   jobs_typeahead.initialize()

   $(".js-jobs-autocomplete").typeahead null,
     displayKey: "title"
     source: jobs_typeahead.ttAdapter()
     templates:
       suggestion: Handlebars.compile("
         <div>
           {{#if title}}
             Title: <strong>{{title}}</strong>
           {{/if}}
           {{#if location}}
             location: <strong>{{location}}</strong>
           {{/if}}
         </div>
       ")

 initialize_jobs_typeahead()
