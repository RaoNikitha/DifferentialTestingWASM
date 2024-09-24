;; 6. Develop a complex nested structure where a `br` instruction targeting an outer control construct should skip multiple inner constructs, including one that culminates in an `unreachable` instruction.

(assert_invalid
  (module
    (func $complex-nesting-with-unreachable
      (block (result i32)
        (block
          (block
            (unreachable)
            (br 2)
          )
          (unreachable)
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)