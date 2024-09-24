;; 1. Create a test with three nested blocks where the `br` instruction targets an outermost block using label indexing. Verify if target label resolution correctly jumps out to the outermost block and resumes after its `end`.

(assert_invalid
  (module (func $br-to-outermost
    (block
      (block
        (block
          (br 2) ;; Attempting to jump to the outermost block
          (unreachable)
        )
        (unreachable)
      )
      (unreachable)
    )
  ))
  "unknown label"
)