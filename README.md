# ravenalula
A Drupal 9 theme based on the Raven Design System.

The site branding block must be enabled and placed in the "Masthead - Branding" region.

The "Main navigation" menu is used as the top level navigation. It's corresponding block must be enabled, placed in the "Masthead - Top Nav"
region, and have the "Expand all menu items" configuration option enabled.

Each call to action button in the masthead should be it's own block in the "Masthead - Action Buttons" region.
You will have to override the block template using a name like "block--loginblock.html.twig".

The "Page title" and "Breadcrumbs" blocks must be enabled and placed in the "Banner" region.

The "Tabs" and "Primary admin actions" must be placed in the "Aside First" region.
