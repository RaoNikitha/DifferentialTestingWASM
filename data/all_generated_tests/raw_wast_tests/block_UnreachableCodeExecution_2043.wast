;; 4. Develop a block with a sequence of well-nested blocks and a `br` instruction that skips several labels incorrectly. Place an unreachable statement after the misdirected branch to see if control flow diverges incorrectly.

(assert_invalid
  (module (func $broken-nested-br (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 3 (i32.const 42))
            (unreachable)
          )
          (unreachable)
        )
        (unreachable)
      )
      (unreachable)
    )
  ))
  "label index out of range"
)