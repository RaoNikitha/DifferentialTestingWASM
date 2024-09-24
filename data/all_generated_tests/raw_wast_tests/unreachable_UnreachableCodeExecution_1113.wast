;; 4. Implement a WebAssembly function with several branches, with one branch directly leading to an `unreachable` instruction to check if trapping occurs when that branch is taken.

(assert_invalid
  (module (func $unreachable-in-branch
    (block
      (br_if 0 (i32.const 1))
      (unreachable)
    )
    (i32.const 1)
  ))
  "type mismatch"
)