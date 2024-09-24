;; Create an invalid CFG scenario by defining `block` and `loop` constructs such that a `br` instruction attempts to target a non-existent label. Verify that both implementations raise appropriate errors. Testing for: Ensuring valid label lookup and error handling for non-existent targets, maintaining CFG integrity.

(assert_invalid
  (module
    (func $invalid-target
      (block (br 1))
    )
  )
  "unknown label"
)