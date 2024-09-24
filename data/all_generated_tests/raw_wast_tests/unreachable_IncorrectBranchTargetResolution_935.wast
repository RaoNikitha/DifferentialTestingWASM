;; Design a function that contains multiple nested `loops` and mistakenly place a `br` instruction to a label beyond its scope. Specific attention should be on an `unreachable` instruction following this erroneous `br` statement to detect inconsistent trap behaviors in the wizard_engine.

(assert_invalid
  (module (func
    (loop (br 2)) (unreachable)
  ))
  "invalid label"
)