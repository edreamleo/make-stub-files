def truncate(s, n):
    '''Return s truncated to n characers.'''
    return s if len(s) <= n else s[:n-3] + '...'