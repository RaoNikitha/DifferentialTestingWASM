;; 6. **Test 6**: Construct a function that improperly uses branch instructions after manipulation of local variables and stack values. Call this function and check if WebAssembly detects the incorrect branch index as an error, as opposed to any potentially inconsistent behavior in Wizard_engine.

(assert_invalid
  (module
    (func $improper-branch-use
      (local $x i32)
      (local.set $x (i32.const 1))
      (block (br 2 (local.get $x)))
    )
  )
  "invalid branch depth"
)