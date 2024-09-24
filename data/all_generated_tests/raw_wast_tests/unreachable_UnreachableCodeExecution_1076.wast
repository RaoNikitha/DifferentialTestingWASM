;; 7. Introduce the `unreachable` instruction within a deeply nested context of mixed control structures (`block`, `loop`, `if`), ensuring that hitting `unreachable` leads to an immediate trap without confusion due to nested layers.

(assert_invalid
  (module (func $type-block-loop-if-unreachable
    (block 
      (loop 
        (if (i32.const 1) 
          (then 
            (unreachable)
          )
        ) 
        (br 1)
      )
    )
    (i32.const 0) 
    (select)
  ))
  "type mismatch"
)