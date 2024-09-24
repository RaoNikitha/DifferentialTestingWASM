;; 4. **Test `nop` in the Middle of a Lifecycle Event**:    Use `nop` within a function lifecycle event (start, call, end) to validate correct sequence maintenance without side-effects.

(assert_invalid
  (module
    (func (export "startFunc") (nop))
    (start 0)
  )
  "start function has incorrect type"
)