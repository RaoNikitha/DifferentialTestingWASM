;; 7. Implement a nested loop structure where the `br` instruction targets the outer block of a nested loop (e.g., `block (loop (loop (br 1)))`). This ensures accurate handling of branching outwards from nested loops.

(assert_invalid
  (module
    (func $nested-loop-br
      (block
        (loop
          (loop
            (br 1)
          )
        )
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)