package com.mooo.mycoz.framework.cache;

import com.mooo.mycoz.framework.util.LinkedListNode;

/**
 * $RCSfile: CacheObject.java,v $
 * $Revision: 1.3 $
 * $Date: 2006/01/07 00:21:06 $
 *
 * Copyright (C) 2000 CoolServlets.com. All rights reserved.
 *
 * ===================================================================
 * The Apache Software License, Version 1.1
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by
 *        CoolServlets.com (http://www.Yasna.com)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Jive" and "CoolServlets.com" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please
 *    contact webmaster@Yasna.com.
 *
 * 5. Products derived from this software may not be called "Jive",
 *    nor may "Jive" appear in their name, without prior written
 *    permission of CoolServlets.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL COOLSERVLETS.COM OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of CoolServlets.com. For more information
 * on CoolServlets.com, please see <http://www.Yasna.com>.
 */


/**
 * Wrapper for all objects put into cache. It's primary purpose is to maintain
 * references to the linked lists that maintain the creation time of the object
 * and the ordering of the most used objects.
 *
 * This class is optimized for speed rather than strictly correct encapsulation.
 */
public final class CacheObject {

   /**
    * Underlying object wrapped by the CacheObject.
    */
    public Object object;

    /**
     * The size of the Cacheable object. The size of the Cacheable
     * object is only computed once when it is added to the cache. This makes
     * the assumption that once objects are added to cache, they are mostly
     * read-only and that their size does not change significantly over time.
     */
    public int size;

    /**
     * A reference to the node in the cache order list. We keep the reference
     * here to avoid linear scans of the list. Every time the object is
     * accessed, the node is removed from its current spot in the list and
     * moved to the front.
     */
    public LinkedListNode lastAccessedListNode;

    /**
     * A reference to the node in the age order list. We keep the reference
     * here to avoid linear scans of the list. The reference is used if the
     * object has to be deleted from the list.
     */
    public LinkedListNode ageListNode;

    /**
     * Creates a new cache object wrapper. The size of the Cacheable object
     * must be passed in in order to prevent another possibly expensive
     * lookup by querying the object itself for its size.<p>
     *
     * @param object the underlying Cacheable object to wrap.
     * @param size the size of the Cachable object in bytes.
     */
    public CacheObject(Object object, int size) {
        this.object = object;
        this.size = size;
    }
}

