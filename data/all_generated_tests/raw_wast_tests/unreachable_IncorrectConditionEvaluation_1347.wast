;; - Test a function with multiple `br_if` instructions where a certain condition must hold true for all branches to prevent reaching an `unreachable` instruction. Validate if any incorrect condition leads to unexpected traps.

(assert_invalid
  (module
    (func $br_if_unreachable (result i32)
      (local i32)
      (local.set 0 (i32.const 10))
      (block (result i32)
        (block (result i32)
          (br_if 0 (i32.eqz (local.get 0)))
          (br_if 1 (i32.const 0))  ;; This will not cause a trap
        )
        (i32.const 1)
      )
      (unreachable)
    )
  )
  "type mismatch"
)