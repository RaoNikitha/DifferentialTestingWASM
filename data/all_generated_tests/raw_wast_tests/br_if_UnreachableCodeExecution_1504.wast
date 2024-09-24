;; - **Test 5**: Test a nested combination of `block` and `loop` constructs where a `br_if` jumps out of multiple nested scopes when false. Post the `br_if`, include an `unreachable`. This evaluates the management of relative label references and proper execution flow.

(assert_invalid
  (module
    (func $nested-block-loop
      (block
        (loop
          (block
            (br_if 2 (i32.const 0))
          )
        )
      )
      (unreachable)
    )
  )
  "unknown label"
)